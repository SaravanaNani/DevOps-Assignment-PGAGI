output "http_listener_arn" {
  value = aws_lb_listener.http.arn
}

output "backend_listener_rule_arn" {
  value = aws_lb_listener_rule.backend.arn
}

output "backend_target_group_arn" {
  value = aws_lb_target_group.backend.arn
}

output "frontend_target_group_arn" {
  value = aws_lb_target_group.frontend.arn
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "alb_dns_name" {
  value = aws_lb.this.dns_name
}