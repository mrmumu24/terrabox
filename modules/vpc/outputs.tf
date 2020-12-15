output "id" {
  description = "The id of the VPC."
  value       = aws_vpc.vpc.id
}

output "cidr" {
  description = "The cidr for the VPC."
  value       = aws_vpc.vpc.cidr_block
}

output "name" {
  description = "The name of the VPC."
  value       = var.vpc_name
}

output "default_rt" {
  description = "The id of the default route table."
  value       = aws_vpc.vpc.default_route_table_id
}
