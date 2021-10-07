#Subnet
#Public subnet
resource "aws_subnet" "public_subnet" {
    count = "${length(var.az)}"
    vpc_id = aws_vpc.vpc.id
    cidr_block = "${cidrsubnet(var.vpc_cidr, 4, count.index)}"
    availability_zone = "${element(var.az, count.index)}"
    map_public_ip_on_launch = false
    tags = {
        Name = "${var.env_name}-public-${element(var.az_name, count.index)}"
    }
}
#App subnet
resource "aws_subnet" "app_subnet" {
    count = "${length(var.az)}"
    vpc_id = aws_vpc.vpc.id
    cidr_block = "${cidrsubnet(var.vpc_cidr, 3, count.index + 2)}"
    availability_zone = "${element(var.az, count.index)}"
    map_public_ip_on_launch = false
    tags = {
        Name = "${var.env_name}-app-${element(var.az_name, count.index)}"
    }
}
#Secure subnet
resource "aws_subnet" "secure_subnet" {
    count = "${length(var.az)}"
    vpc_id = aws_vpc.vpc.id
    cidr_block = "${cidrsubnet(var.vpc_cidr, 4, count.index + 12)}"
    availability_zone = "${element(var.az, count.index)}"
    map_public_ip_on_launch = false
    tags = {
        Name = "${var.env_name}-secure-${element(var.az_name, count.index)}"
    }
}
#Nonexpose subnet
resource "aws_subnet" "nonexpose_subnet" {
    depends_on = ["aws_vpc_ipv4_cidr_block_association.nonexpose_cidr"]
    count = "${length(var.az)}"
    vpc_id = aws_vpc.vpc.id
    cidr_block = "${cidrsubnet(var.vpc_cidr_non_ex, 2, count.index)}"
    availability_zone = "${element(var.az, count.index)}"
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.env_name}-nonexpose-${element(var.az_name, count.index)}"
    }
}