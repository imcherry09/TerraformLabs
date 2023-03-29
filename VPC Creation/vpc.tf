resource "aws_vpc" "terraformvpc1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "terraformvpc1"
  }
}


resource "aws_subnet" "terraformPublicSubnet1" {
  vpc_id     = aws_vpc.terraformvpc1.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "terraformPublicSubnet1"
  }
}

resource "aws_subnet" "terraformPublicSubnet2" {
  vpc_id     = aws_vpc.terraformvpc1.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "terraformPublicSubnet2"
  }
}

resource "aws_subnet" "terraformPublicSubnet3" {
  vpc_id     = aws_vpc.terraformvpc1.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "terraformPublicSubnet3"
  }
}


resource "aws_subnet" "terraformPrivateSubnet1" {
  vpc_id     = aws_vpc.terraformvpc1.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "terraformPrivateSubnet1"
  }
}

resource "aws_subnet" "terraformPrivateSubnet2" {
  vpc_id     = aws_vpc.terraformvpc1.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "terraformPrivateSubnet2"
  }
}

resource "aws_subnet" "terraformPrivateSubnet3" {
  vpc_id     = aws_vpc.terraformvpc1.id
  cidr_block = "10.0.6.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "terraformPrivateSubnet3"
  }
}

resource "aws_internet_gateway" "terraformIgw" {
  vpc_id = aws_vpc.terraformvpc1.id

  tags = {
    Name = "terraformIgw"
  }
}


resource "aws_route_table" "terraformRT" {
  vpc_id = aws_vpc.terraformvpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraformIgw.id
  }


  tags = {
    Name = "terraformRT"
  }
}

resource "aws_route_table_association" "terraformRTAssociaiton-a" {
  subnet_id      = aws_subnet.terraformPublicSubnet1.id
  route_table_id = aws_route_table.terraformRT.id
}

resource "aws_route_table_association" "terraformRTAssociaiton-b" {
  subnet_id      = aws_subnet.terraformPublicSubnet2.id
  route_table_id = aws_route_table.terraformRT.id
}

resource "aws_route_table_association" "terraformRTAssociaiton-c" {
  subnet_id      = aws_subnet.terraformPublicSubnet3.id
  route_table_id = aws_route_table.terraformRT.id
}
