# Terraform state will be stored in S3
terraform {
  backend "s3" {
    bucket = "terraform-bucket-vino1234"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}

# Use AWS Terraform provider
provider "aws" {
  region = "us-west-2"
}

module "vpc" {
    source = "./vpc"
}



module "ec2" {
    source = "./ec2"

    vpc-id                      = "module.vpc.id"
    public-sub                  = "module.vpc.public-id"
    private-sub                 = "module.vpc.private-id"
    security-group-id           = "module.vpc.security-group-id"
    rds-security-group          = "module.rds.db_access_sg_id"
    key-name                    = var.key-name
}

module "rds" {
  source            = "./rds"
  environment       = "production"
  allocated_storage = "20"
  database_name     = var.production_database_name
  database_username = var.production_database_username
  database_password = var.production_database_password
  subnet_ids        = ["module.vpc.subnet1-id", "module.vpc.subnet2-id"]
  vpc_id            = "module.vpc.id"
  instance_class    = "db.t2.micro"
}
