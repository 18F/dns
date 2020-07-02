import checkdmarc
import pytest


@pytest.mark.parametrize("domain", ["afeld.me", "usability.gov"])
def test_has_email_security_records(domain):
    result = checkdmarc.check_domains([domain])
    assert result["spf"]["valid"]
    assert result["dmarc"]["valid"]
