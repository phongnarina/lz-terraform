variable "env_name" {
    description = "Environment Name"
    default = "workload-dev"
}

variable "vpc_cidr" {
    description = "Prduction VPC CIDR Block"
    default = "172.28.0.0/22"
}

variable "az" {
    description = "Availability-zone for this vpc"
    default = ["ap-southeast-1b", "ap-southeast-1c", "ap-southeast-1a"]
}

variable "az_name" {
    description = "Availability-zone name for this vpc"
    default = ["b", "c", "a"]
}