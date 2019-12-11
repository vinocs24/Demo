resource "aws_internet_gateway" "terra-vpc-internet-gateway" {
  vpc_id = aws_vpc.terra-vpc.id

  tags = {
    Name = "demo-vpc-internet-gateway"
  }
}
