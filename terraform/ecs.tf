# クラスター
resource "aws_ecs_cluster" "cluster" {
    name = "cluster"
    # 既存のリソースが有った場合に、一旦削除してから作り直すようになります
    lifecycle {
        create_before_destroy = true
    }
}

# タスク定義
resource "aws_ecs_task_definition" "task_definition" {
    container_definitions    = jsonencode(
        [
            {
                cpu              = 0
                essential        = true
                image            = ""
                logConfiguration = {
                    logDriver = "awslogs"
                    options   = {
                        awslogs-region        = "ap-northeast-1"
                        awslogs-stream-prefix = "golang-ssl-server"
                        awslogs-group         = aws_cloudwatch_log_group.log_group_for_ecs.name
                    }
                }
                mountPoints      = [
                    {
                        containerPath = "/var/www/.cache"
                        sourceVolume  = "mount"
                    }
                ]
                name             = "golang-ssl-server"
                portMappings     = [
                    {
                        containerPort = 443
                        hostPort      = 443
                        protocol      = "tcp"
                    },
                    {
                        containerPort = 80
                        hostPort      = 80
                        protocol      = "tcp"
                    },
                ]
            },
        ]
    )
    cpu                      = "256"
    family                   = "golang-ssl-server"
    memory                   = "512"
    requires_compatibilities = ["EC2"]
    volume {
        host_path = "/var/www/.cache"
        name      = "mount"
    }
}

# サービス
resource "aws_ecs_service" "service" {
    name                               = "service"
    cluster                            = aws_ecs_cluster.cluster.id
    deployment_maximum_percent         = 100
    deployment_minimum_healthy_percent = 0
    desired_count                      = 1
    force_new_deployment    = true
    scheduling_strategy                = "REPLICA"
    task_definition                    = aws_ecs_task_definition.task_definition.arn
}


