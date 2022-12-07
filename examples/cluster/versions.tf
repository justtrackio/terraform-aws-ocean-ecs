terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.45.0"
    }

    spotinst = {
      source  = "spotinst/spotinst"
      version = "1.87.1"
    }
  }

  required_version = "1.3.6"
}
