output "k3d_sg_id" {
  value = aws_security_group.k3d.id
}

output "k3d_ip" {
  value = aws_instance.k3d.public_ip
}

output "k3d" {
  value = format("%s (%s)", aws_instance.k3d.public_dns, aws_instance.k3d.public_ip)
}

