resource "aws_instance" "terraform-cloud-vm" {
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  count                  = 2
  tags = {
    name = "demo"
  }
}
