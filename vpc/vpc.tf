resource "aws_vpc" "terra-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = "true"

  tags {
    Name = "terra-vpc"
  }
}

output "vpc_id" {
  value = aws_vpc.terra-vpc.id
}
