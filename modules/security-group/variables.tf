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

variable "name" {
  description = "The name for the security group."
  type        = string
  default     = ""
}

variable "description" {
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
