module "tags" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git"
  namespace   = var.name
  environment = var.env
  name        = format("%s.%s", var.name, var.env)
  delimiter   = "_"

  tags = {
    owner     = var.owner
    project   = var.project
    env       = var.env
    workspace = var.workspace
    comments  = "k3d-labs"
  }
}

resource "aws_vpc" "k3d_lab" {
  cidr_block           = "10.0.0.0/16"
  tags                 = module.tags.tags
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "k3d_lab_gateway" {
  vpc_id = aws_vpc.k3d_lab.id
}

resource "aws_route" "lab_internet_access" {
  route_table_id         = aws_vpc.k3d_lab.main_route_table_id
  gateway_id             = aws_internet_gateway.k3d_lab_gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

data "aws_availability_zones" "azs" {
  state = "available"
}

resource "aws_route53_zone" "zone" {
  name          = "k3d.lab"
  force_destroy = true
  tags          = module.tags.tags

  vpc {
    vpc_id = aws_vpc.k3d_lab.id
  }
}
