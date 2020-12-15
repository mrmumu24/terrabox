variable "vpc_id" {
  description = "The id of the VPC."
  type        = string
  default     = ""
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = ""
}

variable "vpc_default_rt" {
  description = "The id of default route table."
  type        = string
  default     = ""
}

variable "name" {
  description = "The name for the subnet."
  type        = string
  default     = ""
}

variable "availability_zones" {
  description = "The list of availability zones."
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "The list of subnets."
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
