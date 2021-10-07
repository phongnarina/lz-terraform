#Prefix
variable "env_name" {
}
#VPC CIDR
variable "vpc_cidr" {
    description = "prduction VPC Cidr Block"
}

variable "vpc_cidr_non_ex" {
    description = "prduction Non Expose VPC Cidr Block"
}

variable "az" {
    description = "avalability zone for this account"
    type = list
}

variable "az_name" {
    description = "avalability zone name for this account"
    type = list
}