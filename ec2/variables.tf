//----------------------------------------------------------------------
// Shared Variables
//----------------------------------------------------------------------

variable "vpc-id" {}
variable "public-sub" {}
variable "private-sub" {}
variable "security-group-id" {}
variable "rds-security-group" {}
variable "key-name" {}


//----------------------------------------------------------------------
// Launch Configuration Variables
//----------------------------------------------------------------------

variable "configuration-name" {
    description = "The name for the autoscaling group for the cluster."
    default = "demo-terraform"
}

variable "ami" {
  description = "EC2 Instances AMIs"
  default = "ami-08d489468314a58df"
}

variable "instance-type" {
    description = "The name for the autoscaling group for the cluster."
    default = "t2.micro"
}
