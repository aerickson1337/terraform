# https://github.com/stavxyz/terraform-aws-backend#commands-are-the-fun-part
variable "account_id" {
    type = string
}

variable "profile" {
    type = string
}

provider "aws" {
  # aws cli profile you want to use to run this terraform
  profile = var.profile
  region  = "us-east-1"
}