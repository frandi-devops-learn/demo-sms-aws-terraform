variable "cidr_block" {
  type        = string
  description = "VPC CIDR Block"
}

variable "dns_hostnames" {
  type        = bool
  description = "Enable DNS Hostname for VPC"
}

variable "dns_support" {
  type        = bool
  description = "Enable DNS Support for VPC"
}

variable "vpc_name" {
  type        = string
  description = "VPC name"
}

variable "vpc_pub_subnets" {
  type        = list(string)
  description = "Public Subnets for VPC"
}

variable "vpc_priv_subnets" {
  type        = list(string)
  description = "Private Subnets for VPC"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zone for VPC"
}

variable "map_public" {
  type        = bool
  description = "Map Public IP"
}

variable "pub_name" {
  type        = string
  description = "Name for Public Subnets"
}

variable "priv_name" {
  type        = string
  description = "Name for Private Subnets"
}

variable "igw_name" {
  type        = string
  description = "Internet Gateway Name"
}

variable "rtb_cidr" {
  type        = string
  description = "CIDR block for route table"
}

variable "rtb_name" {
  type        = string
  description = "Route Table Name"
}

variable "rds_sg" {
  type        = string
  description = "RDS Name"
}

variable "backend_ecs_sg" {
  type        = string
  description = "Backend ECS SG Name"
}

variable "alb_sg" {
  type        = string
  description = "ALB Name"
}