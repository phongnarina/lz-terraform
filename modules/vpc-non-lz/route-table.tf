#Route Table
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "${var.env_name}-public-rt"
        Project = "landingzone"
    }
}
resource "aws_default_route_table" "app_rt" {
    default_route_table_id = aws_vpc.vpc.default_route_table_id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_b.id
    }
    tags = {
        Name = "${var.env_name}-app-rt"
        Project = "landingzone"
    }
}

resource "aws_route_table" "nonexpose_rt" {
    depends_on = [aws_nat_gateway.nat_b]
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_b.id
    }

    tags = {
        Name = "${var.env_name}-nonexpose-rt"
        Project = "landingzone"
    }
}