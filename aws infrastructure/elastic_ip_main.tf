resource "aws_eip" "elastic_ip_nat_gateway_1c" {
  vpc = true
}

resource "aws_eip" "elastic_ip_nat_gateway_1d" {
  vpc = true
}
