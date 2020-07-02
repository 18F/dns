import boto3
import checkdmarc
import pytest


def second_level_domain(zone_name):
    parts = zone_name.rstrip(".").split(".")[-2:]
    return ".".join(parts)


def second_level_domains():
    route53 = boto3.client("route53")
    response = route53.list_hosted_zones()
    return set(second_level_domain(zone["Name"]) for zone in response["HostedZones"])


def test_second_level_domain():
    assert second_level_domain("foo.bar.baz.") == "bar.baz"
    assert second_level_domain("foo.bar.") == "foo.bar"


@pytest.mark.parametrize("domain", second_level_domains())
def test_has_email_security_records(domain):
    result = checkdmarc.check_domains([domain])
    assert result["spf"]["valid"], f"{domain} has missing/invalid SPF record"
    assert result["dmarc"]["valid"], f"{domain} has missing/invalid DMARC record"
