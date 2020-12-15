resource "aws_vpc" "vpc" {
  cidr_block = var.cidr

  tags = {
    Name = var.vpc_name
  }
}
