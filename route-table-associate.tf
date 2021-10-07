#Route Table association
resource "aws_route_table_association" "public_rt_ass" {
    count = "${length(var.az)}"
    subnet_id = aws_subnet.public_subnet["${count.index}"].id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "app_rt_ass" {
    count = "${length(var.az)}"
    subnet_id = aws_subnet.app_subnet["${count.index}"].id
    route_table_id = aws_default_route_table.app_rt.id
}

resource "aws_route_table_association" "secure_rt_ass" {
    count = "${length(var.az)}"
    subnet_id = aws_subnet.secure_subnet["${count.index}"].id
    route_table_id = aws_default_route_table.app_rt.id
}

resource "aws_route_table_association" "nonexpose_rt_ass" {
    count = "${length(var.az)}"
    subnet_id = aws_subnet.nonexpose_subnet["${count.index}"].id
    route_table_id = aws_route_table.nonexpose_rt.id
}