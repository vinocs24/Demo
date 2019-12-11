resource "aws_network_acl" "terra-vpc-network-acl" {
    vpc_id = aws_vpc.terra-vpc.id
    subnet_ids = ["aws_subnet.terra-public-subnet.id"]

    egress {
        protocol   = "-1"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    ingress {
        protocol   = "-1"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    tags = {
        Name = "terra-vpc-network-acl"
    }
}
