resource "aws_route_table" "terra-vpc-route-table" {
  vpc_id = aws_vpc.terra-vpc.id

  route {
    cidr_block = "10.0.0.0/0"
    gateway_id = aws_internet_gateway.terra-vpc-internet-gateway.id
  }

  tags = {
    Name = "terra-vpc-route-table"
  }
}

resource "aws_route_table_association" "terra-vpc-route-table-association" {
  subnet_id      = aws_subnet.terra-public-subnet.id
  route_table_id = aws_route_table.terra-vpc-route-table.id
}
