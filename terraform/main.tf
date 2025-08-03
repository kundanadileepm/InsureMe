provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "master" {
  ami           = "ami-0a7d80731ae1b2435"
  instance_type = "t2.medium"
  key_name      = "Assignment-Key"

  tags = {
    Name = "master-node"
  }
}

resource "aws_instance" "test-server" {
  ami           = "ami-0a7d80731ae1b2435"
  instance_type = "t2.medium"
  key_name      = "Assignment-Key"

  tags = {
    Name = "test-server"
  }
}
