resource "aws_nat_gateway" "nat_gateway_2a_my_vpc" {
  allocation_id = var.allocation_nat_gateway_2a_id
  subnet_id     = var.subnet_public_a_id

  tags = {
    Name = "nat_gateway_2a_my_vpc"
  }
}

resource "aws_nat_gateway" "nat_gateway_2c_my_vpc" {
  allocation_id = var.allocation_nat_gateway_2c_id
  subnet_id     = var.subnet_public_c_id

  tags = {
    Name = "nat_gateway_2c_my_vpc"
  }
}
