variable "account_id" {
    type = string
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  backend "s3" {
    bucket = "tfstate-${var.account_id}"
    key = "states/terraform.tfstate"
    dynamodb_table = "terraform-lock"
    encrypt = "true"
  }

  required_version = ">= 0.14.9"
}

variable "profile" {
  type = string
}

provider "aws" {
  # aws cli profile you want to use to run this terraform
  profile = var.profile
  region  = "us-east-1"
}