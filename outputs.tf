output "vpc_cidr" {
  description = "The CIDR for the entire VPC."
  value       = module.vpc.cidr
}

output "private_ips" {
  description = "The list of private ips for master nodes."
  value       = module.ec2.private_ips
}
