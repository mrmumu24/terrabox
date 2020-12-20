variable "aws_region" {
  description = "The region in which the VPC will be deployed."
  default     = ""
}

variable "vpc_name" {
  description = "The name for the VPC."
  default     = ""
}

variable "base_cidr" {
  description = "The cidr for the entire VPC. Default value should be overriden, because is not acceptable by AWS."
  default     = "0.0.0.0/0"
}

variable "availability_zones" {
  description = "The list of availability zones in the region."
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "The list of subnets in the VPC."
  type        = list(string)
  default     = []
}

variable "nacl_rules" {
  description = "The list of nacl rules for subnets."
  type = list(object({
    egress      = bool
    rule_number = number
    protocol    = string
    rule_action = string
    cidr_block  = string
    from_port   = number
    to_port     = number
    icmp_type   = number
    icmp_code   = number
  }))
  default = []
}

variable "key_name" {
  description = "The name for the key pair."
  type        = string
  default     = ""
}

variable "sg_description" {
  description = "The security group description."
  type        = string
  default     = ""
}

variable "sg_rules" {
  description = "The list of sg rules."
  type = list(object({
    type        = string
    protocol    = string
    cidr_blocks = list(string)
    from_port   = number
    to_port     = number
  }))
  default = []
}

variable "ami_id" {
  description = "The id of the ami."
  type        = string
  default     = ""
}

variable "private_ips" {
  description = "The list of private ips for ec2 instances."
  type        = list(string)
  default     = []
}

variable "instance_type" {
  description = "The type of the instance to start. Default is t2.micro"
  type        = string
  default     = "t2.micro"
}
