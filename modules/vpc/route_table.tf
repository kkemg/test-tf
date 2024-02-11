resource "aws_route_table" "global_public_rt" {
  vpc_id  = aws_vpc.global_vpc.id
  tags = {
    Name = "global_public_rt"
  }
}
resource "aws_route" "public_internet_gateway" {
  route_table_id              = aws_route_table.global_public_rt.id
  destination_cidr_block      = "0.0.0.0/0"
  gateway_id                  = aws_internet_gateway.global_igw.id
}
resource "aws_route_table_association" "rt_public_subnet" {
  count           = length(var.public_subnets_cidr) 
  subnet_id       = element(aws_subnet.public_global_subnet[*].id, count.index)
  route_table_id  = aws_route_table.global_public_rt.id
}

resource "aws_route_table" "global_private_rt" {
  vpc_id    = aws_vpc.global_vpc.id
  tags = {
    Name = "global_private_rt"
  }
}
resource "aws_route" "global_private_natgateway" {
  route_table_id              = aws_route_table.global_private_rt.id
  destination_cidr_block      = "0.0.0.0/0"
  nat_gateway_id              = aws_nat_gateway.global_gw[0].id
}
resource "aws_route_table_association" "rt_associate_private" {
  count           = length(var.private_subnets_cidr) 
  subnet_id       = element(aws_subnet.private_global_subnet[*].id, count.index)
  route_table_id  = aws_route_table.global_private_rt.id
}
