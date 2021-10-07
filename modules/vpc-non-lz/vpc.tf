#VPC
resource "aws_vpc" "vpc" {
    cidr_block       = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_hostnames = true

    tags = {
        Name = "${var.env_name}-vpc"
        Project = "landingzone"
    }
}

resource "aws_vpc_ipv4_cidr_block_association" "nonexpose_cidr" {
    vpc_id     = aws_vpc.vpc.id
    cidr_block = var.vpc_cidr_non_ex
}