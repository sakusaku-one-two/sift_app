
terraform {
    required_version = ">=1.0.0"
    backend "s3" {
        bucket = "sakusaku-mac-terraform.tfstate"
        key = "my_sift_system/terraform.tfstate"
        region = "ap-northeast-1"
        encrypt = true
        kms_key_id = "0b8b6c31-8c58-4baf-9578-9a1c028a63ea"
    }
}


provider "aws" {
    region = "ap-northeast-1"
}


module "network" {
    source = "./network"
}



resource "aws_instance" "sample_ec2" {
    
    ami = "ami-0599b6e53ca798bb2" 
    instance_type = "t2.micro"
    subnet_id = module.network.subnet_id
}