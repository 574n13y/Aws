# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_key_pair" "terraform-key-pair" {
  key_name   = "my-key-pair"
  public_key = file("~/.ssh/my-key-pair.pub")
}
