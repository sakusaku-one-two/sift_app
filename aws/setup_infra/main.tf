variable "region" {
    type = string
    default = "ap-northeast-1"
}

provider "aws" {
    region = var.region
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "sakusaku-terraform-state-bucket"
}

resource "aws_s3_bucket_acl" "terraform_state_acl" {
    bucket = aws_s3_bucket.terraform_state.id
    acl = "private"
}
