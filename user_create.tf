provider

terraform {

required_providers {

    aws = {

    source  = "hashicorp/aws"

    version = "~> 3.27"

    }

  }

}

provider "aws" {

  region    = "us-west-1"

access_key = "user_access_key"

secret_key = "user_secret"

}

resource "aws_iam_user" "new_user" {

  name = "NewUserExample"

}

resource "aws_iam_access_key" "AccK" {

  user = aws_iam_user.new_user.name

}

output "secret_key" {

  value = aws_iam_access_key.AccK.secret

  sensitive = true

}

output "access_key" {

  value = aws_iam_access_key.AccK.id

}
