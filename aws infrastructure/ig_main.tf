resource "aws_internet_gateway" "internet_gateway_my_vpc" {
  vpc_id = var.vpc_id

  tags = {
    Name = "internet_gateway_my_vpc"
  }
}
