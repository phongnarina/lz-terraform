#VPC Flow Logs
resource "aws_flow_log" "vpc" {
    iam_role_arn    = aws_iam_role.flowslogsRole.arn
    log_destination = aws_cloudwatch_log_group.vpc.arn
    traffic_type    = "ALL"
    vpc_id          = aws_vpc.vpc.id
}

resource "aws_cloudwatch_log_group" "vpc" {
    name = "${var.env_name}-vpc"
}
resource "aws_iam_role" "flowslogsRole" {
    name = "flowslogsRole"

    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Sid": "",
        "Effect": "Allow",
        "Principal": {
            "Service": "vpc-flow-logs.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}
resource "aws_iam_role_policy" "flowlogsPolicy" {
    name = "flowlogsPolicy"
    role = aws_iam_role.flowslogsRole.id

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Action": [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents",
            "logs:DescribeLogGroups",
            "logs:DescribeLogStreams"
        ],
        "Effect": "Allow",
        "Resource": "*"
        }
    ]
}
EOF
}