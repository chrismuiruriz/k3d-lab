output "bastion_sg_id" {
  value = aws_security_group.bastion.id
}

output "bastion_ip" {
  value = aws_instance.bastion.public_ip
}

output "bastion" {
  value = format("%s (%s)", aws_instance.bastion.public_dns, aws_instance.bastion.public_ip)
}

