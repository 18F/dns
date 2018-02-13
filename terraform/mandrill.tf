locals {
  mandrill_dkim = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;"

  mandrill_mx = [
    "10 30288227.in1.mandrillapp.com",
    "20 30288227.in2.mandrillapp.com"
  ]

  mandrill_spf = "v=spf1 include:spf.mandrillapp.com ?all"
}
