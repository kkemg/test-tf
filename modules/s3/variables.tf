locals {
  current_username = split("/", data.aws_caller_identity.current.arn)[1]
}


data "aws_caller_identity" "current" {}

data "aws_iam_users" "all" {}



