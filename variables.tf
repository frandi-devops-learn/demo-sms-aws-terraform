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

variable "domain_name" {
  type        = string
  description = "Domain Name for ACM"
}

variable "acm_name" {
  type        = string
  description = "ACM Name"
}

variable "alb_name" {
  type        = string
  description = "Application Loadbalancer Name"
}

variable "tg_name" {
  type        = string
  description = "ALB's target Group Name"
}

variable "rds_priv" {
  type        = string
  description = "Private subnet for RDS"
}

variable "rds_name" {
  type        = string
  description = "RDS Name"
}

variable "db_name" {
  type        = string
  description = "DB Name"
}

variable "engine" {
  type        = string
  description = "RDS Engine"
}

variable "engine_version" {
  type        = string
  description = "RDS Engine Version"
}

variable "db_class" {
  type        = string
  description = "RDS Class"
}

variable "user" {
  type        = string
  description = "RDS User Name"
}

variable "password" {
  type        = string
  description = "RDS Password"
  sensitive   = true
}

variable "encrypt" {
  type        = bool
  description = "Storage Encrypt for RDS"
}

variable "storage_type" {
  type        = string
  description = "Storage Type for RDS"
}

variable "storage" {
  type        = string
  description = "Total Storage size for RDS"
}

variable "multi" {
  type        = string
  description = "Multi AZs for RDS"
}

variable "public" {
  type        = string
  description = "Public Access for RDS"
}

variable "skip" {
  type        = string
  description = "Skip Snapshot for RDS"
}

variable "final" {
  type        = string
  description = "Final Snapshot for RDS"
}

variable "apply" {
  type        = string
  description = "Apply immediately for RDS"
}

variable "max" {
  type        = string
  description = "Max Storage for RDS"
}