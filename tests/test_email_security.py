import boto3
import checkdmarc
import pytest


def is_second_level_domain(zone_name):
    levels = zone_name.rstrip(".").split(".")
    return len(levels) == 2


def second_level_domains():
    """Returns the set of second-level domains we control."""
    route53 = boto3.client("route53")
    response = route53.list_hosted_zones()
    return set(
        zone["Name"].rstrip(".")
        for zone in response["HostedZones"]
        if is_second_level_domain(zone["Name"])
    )


def test_is_second_level_domain():
    assert is_second_level_domain("foo.bar")
    assert is_second_level_domain("foo.bar.")
    assert not is_second_level_domain("foo.bar.baz.")


# all second-level domains must have SPF and DMARC
# https://cyber.dhs.gov/bod/18-01/#compliance-guide
@pytest.mark.parametrize("domain", second_level_domains())
def test_has_email_security_records(domain):
    result = checkdmarc.check_domains([domain])

    assert result["spf"]["valid"], f"{domain} has missing/invalid SPF record"
    assert result["dmarc"]["valid"], f"{domain} has missing/invalid DMARC record"

    # https://cyber.dhs.gov/bod/18-01/#where-should-dmarc-reports-be-sent
    reporting_addrs = [
        val["address"] for val in result["dmarc"]["tags"]["rua"]["value"]
    ]
    assert any(addr == "reports@dmarc.cyber.dhs.gov" for addr in reporting_addrs)
