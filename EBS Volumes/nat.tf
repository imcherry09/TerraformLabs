resource "aws_eip" "Teip" {
  vpc=true
}

resource "aws_nat_gateway" "Tnatgw" {
  allocation_id = aws_eip.Teip.id
  subnet_id     = aws_subnet.Tsubnet-public1.id

  tags = {
    Name = "Tnatgw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.Tigw]
}

resource "aws_route_table" "TRT-private" {
  vpc_id = aws_vpc.Tvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Tigw.id
  }

  tags = {
    Name = "TRT-private"
  }
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.Tsubnet-private1.id
  route_table_id = aws_route_table.TRT.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.Tsubnet-private2.id
  route_table_id = aws_route_table.TRT.id
}

resource "aws_route_table_association" "private3" {
  subnet_id      = aws_subnet.Tsubnet-private3.id
  route_table_id = aws_route_table.TRT.id
}


