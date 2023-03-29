resource "aws_key_pair" "levelup_key" {
    key_name = "levelup_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "MyFirstInstnace" {
  ami           = lookup(var.amis, var.AWS_REGION)
  availability_zone = "us-east-1a"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.levelup_key.key_name
  user_data = file("installApache.sh")
  tags = {
    Name = "custom_instance"
  }

}

output "publicIP" {
  value= aws_instance.MyFirstInstnace.public_ip
}


