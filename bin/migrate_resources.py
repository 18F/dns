import argparse
import json
import hcl
import os
import glob
import re
import terrascript
import terrascript.provider as provider
import terrascript.resource as resource

# Initialize some variables
initial_cwd = os.getcwd()

# Define some constants
LOG_DEBUG=3
LOG_INFO=2
LOG_WARN=1
LOG_ERROR=0

LOG_NAMES = ['ERROR', 'WARN', 'INFO', 'DEBUG']

# Define the logger
def logger(level, message):
    if(level == LOG_DEBUG and args.debug):
        print ("%s: %s" % (LOG_NAMES[level], message))
    elif (level < LOG_DEBUG):
        print ("%s: %s" % (LOG_NAMES[level], message))

# Initialize the argument parser
parser = argparse.ArgumentParser(description="Migrate t11 resources to t14")
parser.add_argument('--statefile', type=str)
parser.add_argument('--basepath', help="Use the specified base_path instead of the current working directory", default=initial_cwd)
parser.add_argument('--debug', help='Enable debugging output', type=bool, default=False)
args = parser.parse_args()

# Slurp up the provided statefile
with open(args.statefile) as f:
    existing_state_raw = json.load(f)

# Load the statefile
resources = {}
resources['root'] = {}
for module in existing_state_raw['modules']:
    # We need to determine the module path
    # If the path contains only one element (root), then it is not actually a module and gets added to the root structure
    target = ""

    if (len(module['path']) > 1):
        for path_element in module['path']:
            # Skip over the root element
            if (path_element == 'root'):
                continue
            target += ".module.%s" % path_element
    target = target.lstrip('.')
        
    for resource in module['resources']:
        final_target = ("%s.%s" % (target, resource)).lstrip('.')
        logger(LOG_DEBUG, 'Resource "%s" found in state' % final_target)

    for output in module['outputs']:
        logger(LOG_DEBUG, 'Output "%s" found in state' % output)

# Initialize some variables
tf_files = []
tf_data = {}

# Now let's get the layout of the directory structure, and get the .tf files
for filename in glob.iglob(args.basepath + '**/**', recursive=True):
    # We skip files that are not .tf files
    if not re.search(r'\.tf$', filename):
        continue

    if re.search(r'terraform-14', filename):
        continue

    tf_files.append(filename)

# Now we get to the fun part of renaming resources in files
counter = 0
tf_data = {}
tf_target_data = {}
# Enumerate each file
for filename in tf_files:
    variable_remappings = {}
    if (re.search("init.tf", filename)):
        continue

    logger(LOG_DEBUG, 'Processing file %s' % filename)

    # Replace the string 'terraform' in the file path to 'terraform-14' for the target file
    target_filename = filename.replace('terraform', 'terraform-14')

    # Load the existing hcl for the file
    with open(filename, 'r') as tf:
        #tf_data[target_filename] = [x.strip() for x in tf.readlines()]
        tf_data[target_filename] = tf.readlines()

    # Now let's start having fun
    # Initialize a new terrascript object
    #config = terrascript.Terrascript()
    # And create the target file
    tf_target = open(target_filename, 'w')
    logger(LOG_INFO, "Generating file %s" % target_filename)

    for line in tf_data[target_filename]:
        target_line = line

        # Search for quoted type strings
        m = re.search('(.*type.*=.*)"(string)"(.*)',target_line)
        if (m):
            logger(LOG_INFO, "Removing quoted type string")
            target_line = target_line.replace("\"","")

        # Tag definitions have changed in latest AWS provider, so fix that
        m = re.search('(.*tags.*) {', target_line)
        if (m):
            logger(LOG_INFO, "Modifying tag definition for provider compatibility")
            target_line = "%s = {" % m[1]

        # Search for "version = 1.2.1" - this is for mediapop version pull
        m = re.search('version.*=.*1.2.1', target_line)
        if (m):
            logger(LOG_INFO, "Upping version of mediapop to 1.3.0 from 1.2.1")
            target_line = target_line.replace('1.2.1','1.3.0')

        # Search for interpolation-only expressions
        m = re.search('(.*)"\${(.*)}"(.*)',target_line)
        if (m):
            logger(LOG_INFO, "Removing static interpolation syntax from %s" % (m[2]))
            target_line = "%s%s%s\n"%(m[1],m[2],m[3])

        # Search for remapped resource references
        for remapped in variable_remappings:
            m = re.search('([A-Za-z0-9_]*\.%s\.[A-Za-z0-9]*)' % remapped, target_line)
            if (m):
                logger(LOG_INFO, "Remapping use of %s as %s in variable %s" % (remapped, variable_remappings[remapped], m[1]))
                target_line = target_line.replace(remapped, variable_remappings[remapped])

        # Search for resource names beginning with an invalid character 
        m = re.search('(^(resource|module|output) .*)("([0-9].*)"(.*$))',target_line)
        if (m):
            o_resource_name = m[4]
            n_resource_name = "d_%s" % m[4]
            target_line = target_line.replace(o_resource_name, n_resource_name)
            logger(LOG_INFO, "Remapping resource %s as %s" % (o_resource_name, n_resource_name))
            variable_remappings[o_resource_name] = n_resource_name

        if not ("\n" in target_line):
            target_line = target_line + "\n"

        tf_target.write(target_line)

    # Let's enumerate the tf classes
    #for tfclass in tf_data[target_filename].keys():
        # Classes we care about are 'resource' and 'module' (but probably only resource)
    #    if not ((tfclass == 'resource') or (tfclass == 'module') or (tfclass == 'output')):
    #        continue

        # Now we enumerate each object in the class
    #    for tfobject in tf_data[target_filename][tfclass]:
    #        logger(LOG_DEBUG, 'Found %s/%s in filename %s' % (tfclass, tfobject, filename))

    #        for tfobject_element in tf_data[target_filename][tfclass][tfobject]:
    #            logger(LOG_DEBUG, 'Adding element %s to %s %s with data: %s' % (tfobject_element, tfclass, tfobject, tf_data[target_filename][tfclass][tfobject][tfobject_element]))
    #            tf_target.write('%s "%s" "%s"' % (tfclass, tfobject, tf_data[target_filename][tfclass][tfobject][tfobject_element]))

    # Finally close out the target file
    tf_target.close()
