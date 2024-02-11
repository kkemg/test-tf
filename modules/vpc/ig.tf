resource "aws_internet_gateway" "global_igw" {
  vpc_id = aws_vpc.global_vpc.id
  tags = {
    Name = "global_igw"
  }
}
