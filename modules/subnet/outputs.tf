output "ids" {
  description = "The list of subnet ids."
  value       = aws_subnet.subnets.*.id
}
