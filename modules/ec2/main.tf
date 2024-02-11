resource "tls_private_key" "ec2_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


resource "aws_key_pair" "ec2_key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.ec2_key_pair.public_key_openssh
}




resource "aws_instance" "global_server" {
  ami             = lookup(var.instance_ami, var.region)
  instance_type   = var.instance_type
  count           = var.instance_count
  subnet_id       = element(var.private_subnets[*], count.index)
  key_name        = aws_key_pair.ec2_key_pair.key_name 

  tags = {
    Name = "${var.profile}-ec2-instance"
    Environment = var.environment
  }
}
