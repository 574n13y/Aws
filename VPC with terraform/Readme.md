# Creating VPC with Terraform project

## Task #1 - Create a VPC (Virtual Private Cloud) with CIDR block 10.0.0.0/16
   - Add the following code to your Terraform configuration in main.tf file
    ![vpc main](https://github.com/574n13y/Aws/assets/35293085/70aece87-f250-4b8c-a2f5-d48671e2c487)
     ```
     terraform init
     ```
     ![vpc init](https://github.com/574n13y/Aws/assets/35293085/a77adad6-3f80-49b3-93ad-239feb5b96b6)

      ```
     terraform plan
     ```
     ![vpc plan](https://github.com/574n13y/Aws/assets/35293085/58abddb4-b378-4241-85fc-a0f8ba9115b3)

     ```
     terraform apply
     ```
     ![vpc apply](https://github.com/574n13y/Aws/assets/35293085/3b91f033-3723-46c3-a768-42d63c75bba1)


## Task #2 - Create a public subnet with CIDR block 10.0.1.0/24 in the above VPC.
   - Below code will create a public subnet resource named “public_subnet” with the specified CIDR block.
    ![public subnet](https://github.com/574n13y/Aws/assets/35293085/f22bb21f-640b-4196-b9cf-f24077beb436)

   - Execute terraform plan, apply to build the VPC
    ![public subnet plan](https://github.com/574n13y/Aws/assets/35293085/d0031124-e754-4af6-8579-f4ccce5f4b29)

     ![public subnet apply](https://github.com/574n13y/Aws/assets/35293085/274708ee-b4a2-4be4-8a87-177ed177f787)

   - Go to the subnet console and check new subnet with the name ‘Public Subnet’ is successfully created.
    ![public subnet view](https://github.com/574n13y/Aws/assets/35293085/208a2e49-ca88-4f28-9d47-b6950f938aa2)


## Task #3 - Create a private subnet with CIDR block 10.0.2.0/24 in the above VPC.
   - Below code will create a private subnet resource named “private_subnet” with the specified CIDR block.
    ![private subnet](https://github.com/574n13y/Aws/assets/35293085/54f564dc-2f03-48ce-8106-c3eb8bb6edd9)

   - Execute terraform plan, apply to build the VPC
    ![private subnet apply](https://github.com/574n13y/Aws/assets/35293085/ca64855a-6765-421e-8eb4-42ae10d58cbd)

   - Go to the subnet console and check new subnet with the name ‘Private Subnet’ is successfully created.
    ![private subnet view](https://github.com/574n13y/Aws/assets/35293085/2879562f-c47d-49ed-a8fd-9ef8b000a107)


## Task #4 - Create an Internet Gateway (IGW) and attach it to the VPC.
   - Below code will create an Internet Gateway (IGW).
    ![igw](https://github.com/574n13y/Aws/assets/35293085/940e5725-41cc-4f5f-b6fd-30aa43cd787e)

   - Execute terraform plan, apply to build the VPC
    ![igw plan](https://github.com/574n13y/Aws/assets/35293085/e4ccc637-c88f-4276-97da-7f7786a5cadd)

   - Go to the Internet gateways console and check new subnet with the name ‘My Internet Gateway’ is successfully created.
    ![igw view](https://github.com/574n13y/Aws/assets/35293085/e056443e-1011-4c1c-b807-e84024c8844f)


## Task #5 - Create a route table for the public subnet and associate it with the public subnet. This route table should have a route to the Internet Gateway.
   - First, create a route table for the public subnet.
aws_route_table block creates a new route table in the VPC specified by the vpc_id attribute. It also defines a route that sends all traffic with destination CIDR 0.0.0.0/0 to the internet gateway specified by the gateway_id attribute. The tags attribute sets a name for the route table for easy identification.

   - Then associate the route table with the public subnet.
aws_route_table_association block associates the newly created route table with a public subnet specified by the subnet_id attribute. The route_table_id attribute refers to the ID of the route table created in the previous block.
    ![route table](https://github.com/574n13y/Aws/assets/35293085/60201ed8-cd21-4dd2-bc38-12be50915160)

   - Use the terraform plan & terraform apply to create the route table.
    ![route table plan](https://github.com/574n13y/Aws/assets/35293085/46a3a14a-24db-4555-a084-9fd46828e2a0)

   - We can verify the route table in the AWS console along with the public subnet which is associated in the subnet association section.
    ![route table view](https://github.com/574n13y/Aws/assets/35293085/3e977ccc-e018-4cf4-859c-57e4c9a7e0e2)

## Task #6 Launch an EC2 instance in the public subnet with the following details:
   - AMI : ami-09a81b370b76de6a2
   - region - ap-northeast-1 - as used above 
   - Instance type: t2.micro
   - Add Security Group: Allow SSH access from anywhere
   - User data: Use a shell script to install Apache and host a simple website
   - Create an Elastic IP and associate it with the EC2 instance.
```
 resource "aws_security_group" "ssh_access" {
   name_prefix = "web-server-sg"
   vpc_id = aws_vpc.main.id
   ingress {
     from_port   = 80
     to_port     = 80
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }
   ingress {
     from_port   = 22
     to_port     = 22
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
     from_port   = 0
     to_port     = 0
     protocol    = -1
     cidr_blocks = ["0.0.0.0/0"]
 }
 }

 resource "aws_instance" "web_server" {
  ami                    = "ami-09a81b370b76de6a2"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ssh_access.id]


 user_data = <<-EOF
    #!/bin/bash

    # Update the package list
    sudo apt update

    # Install Apache
    sudo apt install -y apache2
    sudo cat <<HTML > /var/www/html/index.html
    <!DOCTYPE html>
    <html><body><h1>Welcome to my website</h1></body></html>
    HTML

    sudo systemctl restart apache2
  EOF

 tags = {
    Name = "terraform-instance"
  }
}
 resource "aws_eip" "ip" {
   instance = aws_instance.web_server.id
   vpc      = true
   tags = {
     Name = "elastic-ip"
   }
 }
```
 - Execute commands terraform plan, apply to build the ec2.
  ![ec2 plan](https://github.com/574n13y/Aws/assets/35293085/e12fbd4b-9e79-4aae-9742-773fa352e416)
  ![ec2 paln1](https://github.com/574n13y/Aws/assets/35293085/ea03f2f4-f5f1-4710-a9a9-715dc83133c3)
  ![ec2 plan2](https://github.com/574n13y/Aws/assets/35293085/190b52d2-90d7-429b-89f7-27cc94814bba)
  ![ec2 apply](https://github.com/574n13y/Aws/assets/35293085/9a6bec95-e79a-4516-bbd2-6c4886b8e39f)
  ![ec2 apply2](https://github.com/574n13y/Aws/assets/35293085/fb77ea59-da7b-48c0-9d3f-b406246bf7a1)
  ![ec2 apply3](https://github.com/574n13y/Aws/assets/35293085/dd752587-3d55-4296-bf76-06ecf717b393)


## Task #7 - Access the website
   - We can verify the website that is created through the Apache web server.
    ![ip](https://github.com/574n13y/Aws/assets/35293085/c6382afe-abb1-43f4-ae40-56ffb3ddb5d4)
    ![ip1](https://github.com/574n13y/Aws/assets/35293085/565c2c54-ae39-4b32-a671-62c640a90e99)
    ![ip2](https://github.com/574n13y/Aws/assets/35293085/16e4baa0-7a98-40cd-993d-42c98ab2f432)

## Destroy Iac if required
 ![destroy](https://github.com/574n13y/Aws/assets/35293085/543f850f-2cd7-41e6-921d-a5b8e5ac4923)
 ![destroy2](https://github.com/574n13y/Aws/assets/35293085/6038da55-1c42-436b-a7e7-a1ff8d0b73f0)
 ![destroy 3](https://github.com/574n13y/Aws/assets/35293085/73a67563-2cef-4828-bcbb-f31787a7599a)




















     


