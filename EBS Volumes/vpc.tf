resource "aws_vpc" "Tvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Tvpc"
  }
}

resource "aws_subnet" "Tsubnet-public1" {
  vpc_id     = aws_vpc.Tvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Tsubnet-public1"
  }
}

resource "aws_subnet" "Tsubnet-public2" {
  vpc_id     = aws_vpc.Tvpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Tsubnet-public2"
  }
}

resource "aws_subnet" "Tsubnet-public3" {
  vpc_id     = aws_vpc.Tvpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "Tsubnet-public3"
  }
}
resource "aws_subnet" "Tsubnet-private1" {
  vpc_id     = aws_vpc.Tvpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "Tsubnet-private1"
  }
}

resource "aws_subnet" "Tsubnet-private2" {
  vpc_id     = aws_vpc.Tvpc.id
  cidr_block = "10.0.5.0/24"

  tags = {
    Name = "Tsubnet-private2"
  }
}

resource "aws_subnet" "Tsubnet-private3" {
  vpc_id     = aws_vpc.Tvpc.id
  cidr_block = "10.0.6.0/24"

  tags = {
    Name = "Tsubnet-private3"
  }
}
resource "aws_internet_gateway" "Tigw" {
  vpc_id = aws_vpc.Tvpc.id

  tags = {
    Name = "Tvpc"
  }
}

resource "aws_route_table" "TRT" {
  vpc_id = aws_vpc.Tvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Tigw.id
  }

}


resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.Tsubnet-public1.id
  route_table_id = aws_route_table.TRT.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.Tsubnet-public2.id
  route_table_id = aws_route_table.TRT.id
}

resource "aws_route_table_association" "public3" {
  subnet_id      = aws_subnet.Tsubnet-public3.id
  route_table_id = aws_route_table.TRT.id
}



