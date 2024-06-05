terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      configuration_aliases = [
        aws.owner,
      ]
      version = ">= 5.52.0"
    }
    spotinst = {
      source  = "spotinst/spotinst"
      version = ">= 1.175.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0.5"
    }
  }
  required_version = ">= 1.3.0"
}
