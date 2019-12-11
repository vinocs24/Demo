resource "aws_instance" "ec2-instance" {
    #name                        = var.configuration-name
    ami                         = var.ami
    instance_type               = var.instance-type
    security_groups             = [var.security-group-id, var.rds-security-group]
    associate_public_ip_address = true
    key_name                    = var.key-name
    user_data                   = file("ec2/installing-components.sh")
}

