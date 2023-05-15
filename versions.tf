terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      configuration_aliases = [
        aws.owner,
      ]
      version = ">= 4.67"
    }
    spotinst = {
      source  = "spotinst/spotinst"
      version = ">= 1.87.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0.4"
    }
  }
  required_version = ">= 1.3.0"
}
