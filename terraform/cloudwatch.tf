# ECSのロググループ
resource "aws_cloudwatch_log_group" "log_group_for_ecs" {
    name              = "/ecs/log/golang-ssl-server"
    retention_in_days = 7
}