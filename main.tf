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
    security-group-id           = "module.vpc.terra-security-group-id"
    rds-security-group          = "module.rds.terra_db_sg_id"
    key-name                    = var.key-name
}

module "rds" {
  source            = "./rds"
  allocated_storage = "20"
  database_name     = var.production_database_name
  database_username = var.production_database_username
  database_password = var.production_database_password
  vpc_id            = "module.vpc.id"
  subnet_ids        = ["module.vpc.public-id", "module.vpc.private-id"]
  instance_class    = "db.t2.micro"
}
