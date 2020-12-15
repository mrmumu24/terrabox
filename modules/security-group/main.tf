resource "aws_security_group" "sg" {
  vpc_id      = var.vpc_id
  name        = join("_", [var.vpc_name, var.name])
  description = var.description

  tags = {
    Name = join("_", [var.vpc_name, var.name])
  }
}

resource "aws_security_group_rule" "sg_rule" {
  count = length(var.sg_rules)

  type        = var.sg_rules[count.index].type
  protocol    = var.sg_rules[count.index].protocol
  cidr_blocks = var.sg_rules[count.index].cidr_blocks
  from_port   = var.sg_rules[count.index].from_port
  to_port     = var.sg_rules[count.index].to_port

  security_group_id = aws_security_group.sg.id
}
