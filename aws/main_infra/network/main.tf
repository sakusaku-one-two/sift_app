variable "az" {
    type = list(string)
    default = ["ap-northeast-1a","ap-northeast-1c"]
}


resource "aws_vpc" "sample_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true //
    enable_dns_hostnames = true //
    tags = {
        Name = "sample_vpc"
    }

}


resource "aws_subnet" "private_subnets" {
    count = 2
    vpc_id = aws_vpc.sample_vpc.id
    cidr_block = cidrsubnet("10.0.1.0/24", 4, count.index)
    availability_zone = var.az[count.index]
    map_public_ip_on_launch = false
    tags = {
        Name = "private_subnet_${count.index}"
    }   

}

resource "aws_subnet" "public_subnets" {
    count = 2
    vpc_id = aws_vpc.sample_vpc.id
    cidr_block = cidrsubnet("10.0.2.0/24", 4, count.index)
    map_public_ip_on_launch = true
    availability_zone = var.az[count.index]
    tags = {
        Name = "public_subnet_${count.index}"
    }
}


output "public_subnet_ids" {
    value = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
    value = aws_subnet.private_subnets[*].id
}

output "my_az_list" {
    value = var.az[*]
}


