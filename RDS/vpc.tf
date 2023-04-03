resource "aws_vpc" "Tvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Tvpc"
  }
}

resource "aws_subnet" "publicSubnet1" {
  vpc_id     = aws_vpc.Tvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "publicSubnet1"
  }
}

resource "aws_subnet" "publicSubnet2" {
  vpc_id     = aws_vpc.Tvpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "publicSubnet2"
  }
}

resource "aws_subnet" "publicSubnet3" {
  vpc_id     = aws_vpc.Tvpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "publicSubnet3"
  }
}

resource "aws_subnet" "privateSubnet1" {
  vpc_id     = aws_vpc.Tvpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "privateSubnet1"
  }
}

resource "aws_subnet" "privateSubnet2" {
  vpc_id     = aws_vpc.Tvpc.id
  cidr_block = "10.0.5.0/24"

  tags = {
    Name = "privateSubnet2"
  }
}

resource "aws_subnet" "privateSubnet3" {
  vpc_id     = aws_vpc.Tvpc.id
  cidr_block = "10.0.6.0/24"

  tags = {
    Name = "privateSubnet3"
  }
}

resource "aws_internet_gateway" "Tigw" {
  vpc_id = aws_vpc.Tvpc.id

  tags = {
    Name = "Tigw"
  }
}

resource "aws_route_table" "TRT" {
  vpc_id = aws_vpc.Tvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Tigw.id
  }

  
tags = {
    Name = "TRT"
  }
}

resource "aws_route_table_association" "public-1a" {
  subnet_id      = aws_subnet.publicSubnet1.id
  route_table_id = aws_route_table.TRT.id
}

resource "aws_route_table_association" "public-2b" {
  subnet_id      = aws_subnet.publicSubnet2.id
  route_table_id = aws_route_table.TRT.id
}

resource "aws_route_table_association" "public-3c" {
  subnet_id      = aws_subnet.publicSubnet3.id
  route_table_id = aws_route_table.TRT.id
}
