resource "aws_instance" "ec2-instance" {
    name                        = var.configuration-name
    image_id                    = var.image-id
    instance_type               = var.instance-type
    security_groups             = [var.security-group-id, var.rds-security-group]
    associate_public_ip_address = true
    key_name                    = var.key-name
    user_data                   = file("EC2/installing-components.sh")
}

