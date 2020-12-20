resource "aws_instance" "ec2" {
  count = var.number_of_ec2

  ami             = var.ami_id
  subnet_id       = var.subnet_ids[count.index % length(var.subnet_ids)]
  private_ip      = var.private_ips[count.index]
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = var.security_groups

  tags = {
    Name = join("_", [var.vpc_name, var.instance_name, count_index])
  }
}
