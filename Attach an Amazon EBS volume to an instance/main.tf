provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "EC21" {
  ami           ="ami-06f621d90fa6d0" 
  instance_type = "t2.micro"
  tags = {
    Name="windows"
  }
  }

