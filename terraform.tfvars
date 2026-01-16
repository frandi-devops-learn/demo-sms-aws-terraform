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

alb_sg = "demo-sms-alb-sg"

domain_name = "frandisharing.com"

acm_name = "sms-acm"

alb_name = "demo-sms-alb"

tg_name = "demo-sms-bk-tg"

rds_priv = "demo-sms-rds-subnet"

db_name = "uatdb"

rds_name = "demo-sms-rds"

engine = "postgresql"

engine_version = "18.1"

db_class = "db.t4g.micro"

user = "dbadmin"

encrypt = true

storage_type = "gp3"

storage = "5"

multi = false

public = false

skip = true

final = false

apply = true

max = "20"