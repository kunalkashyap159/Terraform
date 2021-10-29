provider "aws" {
access_key = "AKIA2DSYYLG5DBZBKRGL"
secret_key = "z/45rEHAyxOTEcLSjKO5F5mJM0L/csEGHOHiGm75kb"
region = "us-east-1"
}
resource "aws_instance" "web" {
  ami           = "ami-0a3c7d78f0b8f0fce"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}
resource "aws_security_group" "my-web-ssh-sg" {
  name = "my-web-ssh-sg"
  description = "security group that allows ssh and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 
    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 
tags = {
    Name = "my-web-ssh-sg"
  }
}