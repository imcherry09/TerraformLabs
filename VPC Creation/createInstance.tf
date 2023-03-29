resource "aws_key_pair" "deployer_key" {
  key_name   = "deployer_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "terraformInstance" {
  instance_type = "t2.micro"
  ami = lookup(var.AMIS, var.AWS_REGION)
  key_name = aws_key_pair.deployer_key.key_name
  vpc_security_group_ids = [aws_security_group.terraformSG.id]
  subnet_id = aws_subnet.terraformPublicSubnet1.id

  tags = {
    Name= "custom_instance"
  }
}