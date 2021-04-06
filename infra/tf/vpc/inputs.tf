variable "name" {
  description = "A name to be applied to make everything unique and personal"
}

variable "aws_region" {
  description = "Europe"
  default     = "eu-west-1"
}


variable "owner" {
  description = "owner of the resource"
}

variable "project" {
  description = "project name"
}

variable "env" {
  description = "environment - i.e. dev, test, prod"
}

variable "workspace" {
  description = "terraform workspace"
  default     = "default"
}
