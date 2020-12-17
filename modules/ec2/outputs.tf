output "ids" {
  description = "The list of ec2 ids."
  value       = aws_instance.ec2.*.id
}

output "private_ips" {
  description = "The list of ec2 private ips."
  value       = aws_instance.ec2.*.private_ip
}
