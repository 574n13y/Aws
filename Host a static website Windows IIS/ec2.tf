resource "aws_instance" "terraform-cloud-vm" {
  ami                    = data.aws_ami.windows-ami.id
  instance_type          = var.instance_type
  count                  = 1
  key_name               = "terraform-cloud-key"
  vpc_security_group_ids = [aws_security_group.terraform-cloud-vm-sg.id,]
  tags = {
    "Name" = "terraform-cloud-vm-${count.index}"
  }
}
