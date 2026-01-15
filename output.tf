output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.pub_subnets[*].id
}

output "private_subnet_id" {
  value = aws_subnet.priv_subnets[*].id
}

output "demo_sms_backend_ecs_sg" {
  value = aws_security_group.backend_ecs_sg.name_prefix
}

output "acm_dns_validation_records" {
  description = "The DNS records (CNAME) required to validate the ACM certificate."
  value = {
    for dvo in aws_acm_certificate.demo_cert.domain_validation_options : dvo.domain_name => {
      cname_name  = dvo.resource_record_name
      cname_value = dvo.resource_record_value
      cname_type  = dvo.resource_record_type
    }
  }
}