terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.52.0"
      configuration_aliases = [
        aws.owner,
      ]
    }

    spotinst = {
      source  = "spotinst/spotinst"
      version = "1.216.0"
    }
  }

  required_version = ">= 1.3.0"
}
