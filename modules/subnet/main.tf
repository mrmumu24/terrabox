resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = join("_", [var.vpc_name, "igw"])
  }
}

resource "aws_subnet" "subnets" {
  count = length(var.availability_zones)

  vpc_id            = var.vpc_id
  cidr_block        = var.subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = join("_", [
      var.vpc_name,
      var.name,
      var.availability_zones[count.index]
    ])
  }
}

resource "aws_route" "rt" {
  route_table_id         = var.vpc_default_rt
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_network_acl" "nacl" {
  vpc_id     = var.vpc_id
  subnet_ids = [for subnet in aws_subnet.subnets : subnet.id]

  tags = {
    Name = join("_", [var.vpc_name, var.name, "nacl"])
  }
}

resource "aws_network_acl_rule" "nacl_rule" {
  count = length(var.nacl_rules)

  network_acl_id = aws_network_acl.nacl.id
  egress         = var.nacl_rules[count.index].egress
  rule_number    = var.nacl_rules[count.index].rule_number
  protocol       = var.nacl_rules[count.index].protocol
  rule_action    = var.nacl_rules[count.index].rule_action
  cidr_block     = var.nacl_rules[count.index].cidr_block
  from_port      = var.nacl_rules[count.index].from_port
  to_port        = var.nacl_rules[count.index].to_port
  icmp_type      = var.nacl_rules[count.index].icmp_type
  icmp_code      = var.nacl_rules[count.index].icmp_code
}
