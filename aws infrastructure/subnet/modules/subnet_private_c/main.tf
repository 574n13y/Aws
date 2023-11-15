resource "aws_subnet" "subnet_private_c" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.4.0/24"
  availability_zone = var.availability_zone

  tags = {
    Name = "subnet_private_c"
  }
}
