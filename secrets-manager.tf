variable "DB_PASSWORD" {
  description = "The password provided via GitHub Secrets"
  type        = string
  sensitive   = true
}

resource "aws_secretsmanager_secret" "db_pass" {
  name                    = "demo-sms-rds-password"
  description             = "Master password for RDS passed from GitHub"
  recovery_window_in_days = 0

  tags = local.common_tags
}

resource "aws_secretsmanager_secret_version" "db_pass_val" {
  secret_id     = aws_secretsmanager_secret.db_pass.id
  secret_string = var.db_password
}