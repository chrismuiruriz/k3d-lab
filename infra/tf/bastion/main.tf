module "tags" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git"
  namespace   = "bastion"
  environment = var.env
  name        = var.project
  delimiter   = "_"

  tags = {
    name      = "bastion"
    owner     = var.owner
    project   = var.project
    env       = var.env
    workspace = var.workspace
    comments  = "k3d bastion"
  }
}

resource "aws_subnet" "bastion" {
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

resource "aws_security_group" "bastion" {
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

resource "aws_key_pair" "bastion" {
  key_name   = format("%s%s", var.name, "_keypair_k3d_bastion")
  public_key = file(var.public_key_path)
}

data "aws_ami" "latest_bastion" {
  most_recent = true
  owners      = ["self"]
  name_regex  = "^${var.name}-bastion-\\d*$"

  filter {
    name   = "name"
    values = ["${var.name}-bastion-*"]
  }
}

resource "aws_instance" "bastion" {
  ami                    = data.aws_ami.latest_bastion.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.bastion.id
  vpc_security_group_ids = [aws_security_group.bastion.id]
  key_name               = aws_key_pair.bastion.id

  root_block_device {
    volume_size = 100
    volume_type = "gp2"
  }

  tags = module.tags.tags
}
