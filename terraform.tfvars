aws_region = "eu-west-2"

vpc_name           = "dev"
base_cidr          = "10.0.0.0/16"
availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]

subnets = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]

key_name      = "admin_key"
ami_id        = "ami-09e5afc68eed60ef4" # ami: centos7, login-user: centos
instance_type = "t2.micro"
private_ips = [
  "10.0.11.11", "10.0.12.11", "10.0.13.11",
  "10.0.11.12", "10.0.12.12", "10.0.13.12"
]

sg_description = "allows: *"
sg_rules = [
  {
    type        = "ingress"
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 65535
  },
  {
    type        = "egress"
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 65535
  },
]

nacl_rules = [
  # all traffic from vpc
  {
    egress      = false
    rule_number = 90
    protocol    = "all"
    rule_action = "allow"
    cidr_block  = "10.0.0.0/16"
    from_port   = 0
    to_port     = 65535
    icmp_type   = null
    icmp_code   = null
  },
  # all traffic from admin ip (change 0.0.0.0 to admin ip)
  {
    egress      = false
    rule_number = 100
    protocol    = "all"
    rule_action = "allow"
    cidr_block  = "0.0.0.0/32"
    from_port   = 0
    to_port     = 65535
    icmp_type   = null
    icmp_code   = null
  },
  # icmp from world
  {
    egress      = false
    rule_number = 110
    protocol    = "icmp"
    rule_action = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = null
    to_port     = null
    icmp_type   = -1
    icmp_code   = -1
  },
  # http from world
  {
    egress      = false
    rule_number = 120
    protocol    = "tcp"
    rule_action = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 80
    to_port     = 80
    icmp_type   = null
    icmp_code   = null
  },
  # https from world
  {
    egress      = false
    rule_number = 130
    protocol    = "tcp"
    rule_action = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 443
    to_port     = 443
    icmp_type   = null
    icmp_code   = null
  },
  # tcp from world to dynamic ports
  {
    egress      = false
    rule_number = 140
    protocol    = "tcp"
    rule_action = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 49152
    to_port     = 65535
    icmp_type   = null
    icmp_code   = null
  },
  # all traffic to world 
  {
    egress      = true
    rule_number = 100
    protocol    = "all"
    rule_action = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 0
    to_port     = 65535
    icmp_type   = null
    icmp_code   = null
  },
]
