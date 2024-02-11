output "aws_instance" {
  value = one(aws_instance.global_server[*].private_ip)

}
