variable "vpc_id" {
  description = "vpc id"
  type        = string
}

variable "availability_zones" {
  description = "availability zones"
  type = object({
    a = string
    b = string
    c = string
    d = string
  })
}