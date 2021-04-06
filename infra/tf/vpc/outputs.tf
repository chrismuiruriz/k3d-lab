output "zone" {
  value = aws_route53_zone.zone
}

output "az" {
  value = data.aws_availability_zones.azs.names
}

output "vpc" {
  value = aws_vpc.k3d_lab
}

