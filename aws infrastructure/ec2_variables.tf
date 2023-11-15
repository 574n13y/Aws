variable "vpc_security_group_ids" {
  description = "vpc security group ids"
  type        = list(string)
}

variable "availability_zones" {
  description = "availability zones"
  type = object({
    a = string
    b = string
    c = string
  })
}

variable "subnet_id" {
  description = "subnet id"
  type        = string
}
