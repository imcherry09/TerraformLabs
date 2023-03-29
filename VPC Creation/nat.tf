resource "aws_eip" "eip-nat" {
  vpc = "true"
}

resource "aws_nat_gateway" "terraformNatgw" {
  allocation_id = aws_eip.eip-nat.id
  subnet_id     = aws_subnet.terraformPublicSubnet1.id

  tags = {
    Name = "terraformNatgw"
  }
  depends_on = [aws_internet_gateway.terraformIgw]
}


resource "aws_route_table" "terraformRT-Private" {
  vpc_id = aws_vpc.terraformvpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraformNatgw.id
  }


  tags = {
    Name = "terraformRT-Private"
  }
}

resource "aws_route_table_association" "terraformRTAssociaiton-a-pvt" {
  subnet_id      = aws_subnet.terraformPrivateSubnet1.id
  route_table_id = aws_route_table.terraformRT-Private.id
}

resource "aws_route_table_association" "terraformRTAssociaiton-b-pvt" {
  subnet_id      = aws_subnet.terraformPrivateSubnet2.id
  route_table_id = aws_route_table.terraformRT-Private.id
}

resource "aws_route_table_association" "terraformRTAssociaiton-c-pvt" {
  subnet_id      = aws_subnet.terraformPrivateSubnet3.id
  route_table_id = aws_route_table.terraformRT-Private.id
}