/*==========
    RDS
============*/

/* subnet used by rds */
resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "terra-db-subnet"
  description = "RDS subnet group"
  subnet_ids  = [var.subnet_ids]

}
resource "aws_db_instance" "rds" {
    identifier             = "terraform-db"
    allocated_storage      = var.allocated_storage
    engine                 = "mysql"
    engine_version         = "5.7.22"
    port                   = "3306"
    instance_class         = var.instance_class
    name                   = var.database_name
    username               = var.database_username
    password               = var.database_password
    availability_zone      = "us-west-2b"
    vpc_security_group_ids = [aws_security_group.rds_sg.id]
    multi_az               = var.multi_az
    db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.id
    parameter_group_name   = "default.mysql5.7"
    publicly_accessible    = false
}

