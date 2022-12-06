module "example" {
  source = "../.."

  providers = {
    aws       = aws
    aws.owner = aws.owner
  }

  label_order    = ["name"]
  name           = "ecs-cluster"
  vpc_id         = "vpc-1245f04ef5690379a"
  initial_vpc_id = "vpc-2c1a11081fd686d0d"
  subnet_ids     = ["subnet-04016197c1fb0e3bf", "subnet-0540fa26a2ae5553a", "subnet-012ca55fcddf605af"]
  region         = "eu-central-1"
  stage          = "stage"
  environment    = "env"
}
