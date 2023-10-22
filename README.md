# Aws

## Aws using Iaac Tool ie Terraform 

## POC

```
Choosing Provider, region, machine type, instance type, no of instances, vpc.
```
```
terraform init ---> The terraform init command initializes a working directory containing Terraform configuration files.
```

![1](https://github.com/574n13y/Aws/assets/35293085/531b2ef7-3d24-4a74-8ee6-eb9820f82606)

```
terraform plan ----> Reviewing Plans
terraform apply ----> Applying them
```
![2](https://github.com/574n13y/Aws/assets/35293085/fba084b9-e9ef-4263-baf5-cf5f32e9c8cf)

```
output
```
![3](https://github.com/574n13y/Aws/assets/35293085/f27ff4a1-1cc5-4ccb-8d1e-a22a2b8ac06e)

```
terraform destroy --->Destroying and preview the changes in terraform
```
![4](https://github.com/574n13y/Aws/assets/35293085/a52cb3f9-0c3f-4a0c-aa8d-479b63a096c7)

```
Output
```
![5](https://github.com/574n13y/Aws/assets/35293085/363fe757-73b7-42e2-8d4f-cc77e8f96ea5)

```
Code
```
![6](https://github.com/574n13y/Aws/assets/35293085/e3f7d276-27dd-487b-a36a-2719baa12231)

# main.tf

```
provider "aws" {
  region = "ap-northeast-1"
}
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_instance" "ec2" {
  ami           = "ami-06323ff1c3178cee1"
  instance_type = var.list[3]
  tags = {
    name = "Windows_Server-${count.index}"
  }
  count = 5

}
variable "list" {
  type    = list(any)
  default = ["m5.large", "m5.xlarge", "t2.medium", "t2.mirco"]
}

variable "types" {
  type = map(any)
  default = {
    ap-south-1     = "t2.micro"
    us-west-2      = "t2.nano"
    ap-northeast-1 = "t2.micro"
    us-west-1      = "t2.small"
  }
}
```
## init, fmt, plan , apply, destroy 

```
[plan](https://github.com/574n13y/basic_scripts/blob/main/plan.sh/) 
```
```
[apply](https://github.com/574n13y/basic_scripts/blob/main/apply.sh/) 
```
```
[destroy](https://github.com/574n13y/basic_scripts/blob/main/destroy.sh/) 
```
