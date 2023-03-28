module "sg" {
  source  = "cloudposse/security-group/aws"
  version = "2.0.1"

  attributes = ["ecs-cluster"]

  allow_all_egress = true

  rules = [
    {
      type             = "ingress"
      protocol         = "-1"
      from_port        = 0
      to_port          = 0
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      description      = "Allow all ingress"
    }
  ]

  vpc_id = var.vpc_id

  context = module.this.context
}
