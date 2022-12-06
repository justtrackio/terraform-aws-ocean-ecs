provider "aws" {
  region  = "eu-central-1"
  profile = "participant"
}

provider "aws" {
  alias   = "owner"
  region  = "eu-central-1"
  profile = "owner"
}

data "aws_secretsmanager_secret" "token" {
  name = "spotinst_token"
}

data "aws_secretsmanager_secret_version" "token" {
  secret_id = data.aws_secretsmanager_secret.token.id
}

data "aws_secretsmanager_secret" "account" {
  name = "spotinst_account"
}

data "aws_secretsmanager_secret_version" "account" {
  secret_id = data.aws_secretsmanager_secret.account.id
}

provider "spotinst" {
  token   = data.aws_secretsmanager_secret_version.token.secret_string
  account = data.aws_secretsmanager_secret_version.account.secret_string
}
