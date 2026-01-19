resource "aws_ecs_cluster" "main" {
  name = "demo-sms-cluster"

  tags = local.common_tags
}

resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/demo-sms-backend"
  retention_in_days = 7
}

resource "aws_ecs_task_definition" "backend" {
  family                   = "demo-sms-backend"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([
    {
      name      = "demo-sms-bk-api"
      image     = "${aws_ecr_repository.demo_ecr.repository_url}:latest"
      essential = true

      portMappings = [{
        containerPort = 3000
        hostPort      = 3000
        protocol      = "tcp"
      }]

      # Pulling secrets directly from RDS Managed Secret
      secrets = [
        {
          name      = "DB_PASSWORD"
          valueFrom = "${aws_db_instance.rds.master_user_secret[0].secret_arn}:password::"
        },
        {
          name      = "DB_USER"
          valueFrom = "${aws_db_instance.rds.master_user_secret[0].secret_arn}:username::"
        }
      ]

      environment = 
        { name = "DB_HOST", value = aws_db_instance.rds.address },
        { name = "DB_NAME", value = var.db_name },
        { name = "DB_PORT", value = "5432" },
        { name = "S3_BUCKET", value = "demo-sms-internal-storage" },
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.ecs_logs.name
          "awslogs-region"        = "ap-southeast-1"
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])
}

resource "aws_ecs_service" "backend_service" {
  name            = "demo-sms-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.backend.arn
  desired_count   = 2 # High availability
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = aws_subnet.priv_subnets[*].id
    security_groups  = [aws_security_group.backend_ecs_sg.id]
    assign_public_ip = false # Security: No public IP in private subnets
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_tg.arn
    container_name   = "demo-sms-bk-api"
    container_port   = 3000
  }

  # Allow the service to deploy even if RDS isn't finished yet
  depends_on = [aws_db_instance.rds]
}