resource "aws_db_subnet_group" "TDbSubnetGroup" {
  name       = "main"
  subnet_ids = [aws_subnet.privateSubnet1.id, aws_subnet.privateSubnet2.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_parameter_group" "TmariadbParameterGroup" {
  name   = "mariadb"
  family = "mariadb10.6"

}

resource "aws_db_instance" "mariaDbInstance" {
  allocated_storage       = 20
  db_name                 = "mymariadb"
  engine                  = "mariadb"
  engine_version          = "10.6"
  instance_class          = "db.t2.micro"
  username                = "root"
  password                = "mariadb123"
  db_subnet_group_name    = aws_db_subnet_group.TDbSubnetGroup.name
  parameter_group_name    = aws_db_parameter_group.TmariadbParameterGroup.name
  multi_az                = false
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.allow_mariadb.id]
  storage_type            = "gp2"
  backup_retention_period = 30
  availability_zone       = aws_subnet.privateSubnet1.availability_zone
  tags = {
    Name = "mariadb-instance"
  }
}

output "rds" {
  value = aws_db_instance.mariaDbInstance.endpoint
}