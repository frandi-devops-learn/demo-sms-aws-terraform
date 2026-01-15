terraform {
  backend "s3" {
    bucket  = "demo-terraform-sms"
    region  = "ap-southeast-1"
    key     = "demo-sms/terraform.tfstate"
    encrypt = true
  }
}