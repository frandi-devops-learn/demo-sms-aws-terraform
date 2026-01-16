resource "aws_db_subnet_group" "rds_priv" {
  name       = "var.rds_priv"
  subnet_ids = aws_subnet.priv_subnets[*].id

  tags = merge(local.common_tags, {
    Name = "${var.rds_priv}"
  })
}

resource "aws_db_parameter_group" "rds_prameter" {
  name        = "demo-sms-db-parameter-group"
  family      = "postgres18"
  description = "Performance tuned parameters for PostgreSQL 18"

  # STATIC: Requires Reboot
  parameter {
    name         = "shared_buffers"
    value        = "{DBInstanceClassMemory/32768}"
    apply_method = "pending-reboot" 
  }

  # STATIC: Requires Reboot
  parameter {
    name         = "max_connections"
    value        = "100"
    apply_method = "pending-reboot"
  }

  # DYNAMIC: Can be applied immediately
  parameter {
    name         = "work_mem"
    value        = "4096"
    apply_method = "immediate"
  }

  # DYNAMIC: Can be applied immediately
  parameter {
    name         = "effective_io_concurrency"
    value        = "32"
    apply_method = "immediate"
  }

  # DYNAMIC: Can be applied immediately
  parameter {
    name         = "autovacuum_vacuum_scale_factor"
    value        = "0.05"
    apply_method = "immediate"
  }

  # DYNAMIC: Can be applied immediately
  parameter {
    name         = "autovacuum_vacuum_cost_limit"
    value        = "200"
    apply_method = "immediate"
  }

  # DYNAMIC: Can be applied immediately
  parameter {
    name         = "log_min_duration_statement"
    value        = "2000"
    apply_method = "immediate"
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(local.common_tags, {
    Name = "demo-sms-db-parameter-group"
  })
}

resource "aws_db_instance" "rds" {
  identifier     = var.rds_name
  db_name        = var.db_name
  engine         = var.engine
  engine_version = var.engine_version
  instance_class = var.db_class

  username = var.user
  password = var.password

  storage_encrypted     = var.encrypt
  storage_type          = var.storage_type
  allocated_storage     = var.storage
  max_allocated_storage = var.max

  db_subnet_group_name      = aws_db_subnet_group.rds_priv.name
  parameter_group_name      = aws_db_parameter_group.rds_prameter.name
  vpc_security_group_ids    = [aws_security_group.rds_sg.id]
  multi_az                  = var.multi
  publicly_accessible       = var.public
  skip_final_snapshot       = var.skip
  final_snapshot_identifier = var.final
  apply_immediately         = var.apply

  tags = merge(local.common_tags, {
    Name = "${var.rds_name}"
  })
}