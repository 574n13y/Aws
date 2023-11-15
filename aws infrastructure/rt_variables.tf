variable "vpc_id" {
  description = "vpc_id"
  type        = string
}

variable "internet_gateway_id" {
  description = "internet_gateway_id"
  type        = string
}

# variable "nat_gateway_2a_id" {
#   description = "nat_gateway_2a_id"
#   type        = string
# }

# variable "nat_gateway_2c_id" {
#   description = "nat_gateway_2c_id"
#   type        = string
# }

variable "subnet_public_c_id" {
  description = "subnet_public_c_id"
  type        = string
}

variable "subnet_public_d_id" {
  description = "subnet_public_d_id"
  type        = string
}

variable "subnet_private_c_id" {
  description = "subnet_private_c_id"
  type        = string
}

variable "subnet_private_d_id" {
  description = "subnet_private_d_id"
  type        = string
}
