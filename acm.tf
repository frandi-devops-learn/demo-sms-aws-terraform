resource "aws_acm_certificate" "demo_cert" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
  subject_alternative_names = ["*.${var.domain_name}"]

  tags = merge(local.common_tags, {
    Name = "${var.acm_name}"
  })
}