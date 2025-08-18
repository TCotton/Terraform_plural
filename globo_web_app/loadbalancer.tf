# aws_elb_service_account
data "aws_elb_service_account" "root" {
  # This data source is used to get the AWS ELB service account for S3 bucket policy
}

resource "aws_lb" "nginx" {
  count              = var.vpc_public_subnet_count
  name               = "globo-web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public_subnets[count.index].id]

  enable_deletion_protection = false

  access_logs {
    bucket  = local.s3_bucket_name
    enabled = true
    prefix  = "alb-logs"
  }

  tags = local.common_tags
}

# aws_lb_target_group
resource "aws_lb_target_group" "nginx" {
  name     = "nginx-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.app.id

  tags = local.common_tags
}

# aws_lb_listener
resource "aws_lb_listener" "nginx" {
  load_balancer_arn = aws_lb.nginx.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx.arn
  }

  tags = local.common_tags
}

# aws_lb_target_group_attachment
resource "aws_lb_target_group_attachment" "nginx" {
  count            = var.instance_count
  target_group_arn = aws_lb_target_group.nginx.arn
  target_id        = aws_instance.nginx[count.index].id
  port             = 80
}
