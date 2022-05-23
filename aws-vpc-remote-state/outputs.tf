output "subnet_ids" {
  value = aws_subnet.aws_subnet.id
}

output "security_group_ids" {
  value = aws_security_group.security_group.id
}
