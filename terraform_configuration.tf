terraform {
  required_version = "0.12.28"

  required_providers {
      aws = ">= 2.68.0"
  }

  backend "s3" {
    key = "aws-common"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
  version = "~> 2.0"
}

provider "aws" {
  region = "us-east-1"
  alias = "us-east-aws"
  version = "~> 2.0"
}