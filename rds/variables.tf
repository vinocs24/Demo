variable "subnet_ids" {
  type        = list
  description = "Subnet ids"
}

variable "vpc_id" {
  description = "The VPC id"
}

variable "allocated_storage" {
  default     = "20"
  description = "The storage size in GB"
}

variable "instance_class" {
  description = "The instance type"
}

variable "multi_az" {
  default     = false
  description = "Muti-az allowed?"
}

variable "database_name" {
  default     = "terraform"
  description = "The database name"
}

variable "database_username" {
  default     = "admin"
  description = "The username of the database"
}

variable "database_password" {
  default     = "admin123"
  description = "The password of the database"
}
