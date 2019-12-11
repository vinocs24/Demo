resource "aws_subnet" "terra-public-subnet" {
    vpc_id     = aws_vpc.terra-vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-west-2a"

    tags = {
        Name = "terra-public-subnet"
    }
}

resource "aws_subnet" "terra-private-subnet" {
    vpc_id     = aws_vpc.terra-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-west-2b"

    tags = {
        Name = "terra-private-subnet"
    }
}


output "public-id" {
  value = aws_subnet.terra-public-subnet.id
}

output "private-id" {
  value = aws_subnet.terra-private-subnet.id
}


