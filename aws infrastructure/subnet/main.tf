module "subnet_public_a" {
  source            = "./modules/subnet_public_a"
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zones.a
}

module "subnet_public_c" {
  source            = "./modules/subnet_public_c"
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zones.c
}

module "subnet_private_a" {
  source            = "./modules/subnet_private_a"
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zones.a
}

module "subnet_private_c" {
  source            = "./modules/subnet_private_c"
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zones.c
}
