output "public_subnets" {
  value = aws_subnet.public_global_subnet[*].id
}

output "private_subnets" {
  value = aws_subnet.private_global_subnet[*].id
}
