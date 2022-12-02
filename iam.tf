resource "aws_iam_instance_profile" "default" {
  name = "${module.this.id}-ecsInstanceProfile"
  role = aws_iam_role.default.name
  tags = module.this.tags
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "default" {
  name               = "${module.this.id}-ecsInstanceRole"
  assume_role_policy = join("", data.aws_iam_policy_document.assume_role[*].json)
  tags               = module.this.tags
}

resource "aws_iam_role_policy_attachment" "amazon_ec2_container_service_for_ec2_role" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  role       = aws_iam_role.default.name
}

resource "aws_iam_role_policy_attachment" "amazon_ec2_container_registry_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.default.name
}
