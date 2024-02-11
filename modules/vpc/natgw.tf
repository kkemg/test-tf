resource "aws_eip" "global_external_ip" {
  domain   = "vpc"
  tags = {
    Name = "global_external_nat_ip"
  }
}

resource "aws_nat_gateway" "global_gw" {
    count         = 1
    allocation_id = element(aws_eip.global_external_ip[*].id, count.index)
    subnet_id     = element(aws_subnet.public_global_subnet[*].id, count.index)
    tags = {
        Name = "global_gw"
    }
  depends_on = [aws_internet_gateway.global_igw]
}
