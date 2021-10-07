module "workload_dev_account" {
    source = "./modules/vpc-non-lz"
    #Prefix
    env_name = var.env_name
    #VPC CIDR
    vpc_cidr = var.vpc_cidr
    az = var.az
    az_name = var.az_name
    vpc_cidr_non_ex = "100.64.0.0/19"
}