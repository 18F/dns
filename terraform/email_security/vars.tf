variable "dmarc_pct" {
  default     = 100
  description = "https://cyber.dhs.gov/bod/18-01/#how-should-dmarc-be-deployed"
}

variable "dmarc_policy" {
  default     = "reject"
  description = "https://cyber.dhs.gov/bod/18-01/#how-should-dmarc-be-deployed"
}

variable "dmarc_rua" {
  default     = "mailto:dmarcreports@gsa.gov"
  description = "In addition to DHS"
}

variable "dmarc_ruf" {
  default = "mailto:dmarcfailures@gsa.gov"
}

variable "spf_records" {
  default     = ["v=spf1 -all"]
  description = "Defaults to blocking all mail"
}

variable "zone_id" {
  type = "string"
}
