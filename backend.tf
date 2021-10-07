terraform {
  backend "s3" {
    bucket = "awsgs-lz-terraform-network-state-e8le8en8d7uk"
    key    = "workload-nonprd-acc/vpc/terraform.tfstate"
    region = "ap-southeast-1"
    shared_credentials_file = "~/.aws/config"
    profile = "awsgs-network-prd"
  }
}
