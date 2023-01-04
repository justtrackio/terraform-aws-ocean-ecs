module "example" {
  source = "../.."

  providers = {
    aws       = aws
    aws.owner = aws.owner
  }

  name                               = "foo"
  vpc_id                             = "vpc-00000000000000000"
  initial_vpc_id                     = "vpc-00000000000000000"
  subnet_ids                         = ["subnet-00000000000000000", "subnet-11111111111111111", "subnet-22222222222222222"]
  aws_region                         = "eu-central-1"
  service_discovery_private_dns_name = "foo.baa"
}
