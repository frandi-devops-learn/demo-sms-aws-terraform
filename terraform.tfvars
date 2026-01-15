cidr_block = "10.0.0.0/16"

dns_hostnames = true

dns_support = true

vpc_name = "demo-sms"

vpc_pub_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

vpc_priv_subnets = ["10.0.5.0/24", "10.0.6.0/24"]

azs = ["ap-southeast-1a", "ap-southeast-1b"]

map_public = true

pub_name = "demo-sms-pub"

priv_name = "demo-sms-priv"

igw_name = "demo-sms-igw"

rtb_cidr = "0.0.0.0/0"

rtb_name = "demo-sms"

rds_sg = "demo-sms-rds-sg"

backend_ecs_sg = "demo-sms-bk-sg"

alb_sg = "demo-alb-sg"