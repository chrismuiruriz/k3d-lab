module "tags" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git"
  namespace   = "k3d"
  environment = var.env
  name        = var.project
  delimiter   = "_"

  tags = {
    name      = "k3d"
    owner     = var.owner
    project   = var.project
    env       = var.env
    workspace = var.workspace
    comments  = "k3d k3d"
  }
}

resource "aws_subnet" "k3d" {
  vpc_id                  = var.vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.az[0]
  tags                    = module.tags.tags
}

variable "ports" {
  type = list(any)
  default = [
    { from = 22, to = 22 },
    { from = 80, to = 80 },
    { from = 8080, to = 8080 },
    { from = 443, to = 443 },
    { from = 8443, to = 8443 },
    { from = 30000, to = 32767 }
  ]
}

resource "aws_security_group" "k3d" {
  vpc_id = var.vpc.id
  tags   = module.tags.tags

  dynamic "ingress" {
    for_each = var.ports
    content {
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = ingress.value.from
      to_port     = ingress.value.to
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "k3d" {
  key_name   = format("%s%s", var.name, "_keypair_k3d_k3d")
  public_key = file(var.public_key_path)
}

data "aws_ami" "latest_k3d" {
  most_recent = true
  owners      = ["self"]
  name_regex  = "^${var.name}-k3d-\\d*$"

  filter {
    name   = "name"
    values = ["${var.name}-k3d-*"]
  }
}

resource "aws_instance" "k3d" {
  ami                    = data.aws_ami.latest_k3d.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.k3d.id
  vpc_security_group_ids = [aws_security_group.k3d.id]
  key_name               = aws_key_pair.k3d.id

  root_block_device {
    volume_size = 100
    volume_type = "gp2"
  }

  tags = module.tags.tags
}
