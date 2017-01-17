#!/usr/bin/env python3
#  -*- coding: utf-8 -*-

import argparse
import boto3
import pprint

pp = pprint.PrettyPrinter(indent=4)

parser = argparse.ArgumentParser(description='Print zone files from Route 53, optionally in Terraform format')
parser.add_argument('--name', dest='name', help='Zone name')
parser.add_argument('--terraform', dest='terraform', help='Terraform file to output to')
args = parser.parse_args()

print("Zones in this account:\n")
client = boto3.client('route53')

zones = client.list_hosted_zones()
zoneId = None
for zone in zones['HostedZones']:
    print(zone['Id'] + ' ' +zone['Name'])
    if args.name and zone['Name'] == args.name:
        zoneId = zone['Id']

terraform_file = None
if zoneId:
    print('\nFound zone ' + args.name)
    recordsets = client.list_resource_record_sets(HostedZoneId = zoneId)
    if recordsets['IsTruncated']:
        print("TRUNCATED - TOO MANY RECORDS!")
    else:
        zone_name = args.name.replace('.','_')
        if args.terraform:
            terraform_file = open(args.terraform, 'w')
            terraform_file.writelines([
                'resource "aws_route53_zone" "' + zone_name + 'zone" {\n',
                '  name = "' + args.name + '"\n',
                '  tags {\n',
                '    Project = "dns"\n',
                '  }\n',
                '}\n\n'])
        for record in recordsets['ResourceRecordSets']:
            if args.terraform:
                if record['Type'] in ['A', 'AAAA', 'TXT', 'CNAME', 'MX', 'NS']:
                    terraform_file.writelines([
                        'resource "aws_route53_record" "' + zone_name + record['Name'].replace('\\052','star').replace('.','_') + record['Type'].lower() + '" {\n',
                        '  zone_id = "${aws_route53_zone.' + zone_name + 'zone.zone_id}"\n',
                        '  name = "' + record['Name'].replace('\\052','*') + '"\n',
                        '  type = "' + record['Type'] + '"\n'])
                    if 'TTL' in record:
                        terraform_file.write('  ttl = ' + str(record['TTL']) + '\n')
                    if 'ResourceRecords' in record:
                        records = []
                        for rrecord in record['ResourceRecords']:
                            records.append(rrecord['Value'].rstrip('"').lstrip('"'))
                        terraform_file.write('  records = ["' + '", "'.join(records) + '"]\n')
                    if 'AliasTarget' in record:
                        aliastarget = record['AliasTarget']
                        terraform_file.writelines([
                            '  alias {\n',
                            '    name = "' + aliastarget['DNSName'] + '"\n',
                            '    zone_id = "' + aliastarget['HostedZoneId'] + '"\n',
                            '    evaluate_target_health = ' + str(aliastarget['EvaluateTargetHealth']).lower() + '\n',
                            '  }\n'])
                    terraform_file.write('}\n\n')
                    pp.pprint(record)
                else:
                    print('Discarded record of type ' + record['Type'])
            else:
                pp.pprint(record)
        if terraform_file:
            terraform_file.writelines([
                'output "' + args.name.replace('.','_') + 'ns" {\n',
                '  value="${aws_route53_zone.' + zone_name + 'zone.name_servers}"\n',
                '}\n'])
            terraform_file.close()
