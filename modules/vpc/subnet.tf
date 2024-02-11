resource "aws_subnet" "public_global_subnet" {
  count                   = length(var.public_subnets_cidr)
  vpc_id                  = aws_vpc.global_vpc.id
  cidr_block              = var.public_subnets_cidr[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "public_global_subnet${count.index}"
  }
}

resource "aws_subnet" "private_global_subnet" {
  count                   = length(var.private_subnets_cidr)
  vpc_id                  = aws_vpc.global_vpc.id
  cidr_block              = var.private_subnets_cidr[count.index]
  availability_zone       = var.availability_zones[count.index]
  tags = {
    Name = "private_global_subnet${count.index}"
  }
}

