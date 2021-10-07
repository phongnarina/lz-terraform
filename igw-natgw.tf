resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        Name = "${var.env_name}-igw"
        Project = "landingzone"
    }
}
#Elastic IP
resource "aws_eip" "nat_b" {
    vpc      = true
}

#NAT Gateway
resource "aws_nat_gateway" "nat_b" {
    allocation_id = aws_eip.nat_b.id
    subnet_id     = aws_subnet.public_subnet[1].id

    tags = {
        Name = "${var.env_name}-nat-gw"
        Project = "landingzone"
    }
}