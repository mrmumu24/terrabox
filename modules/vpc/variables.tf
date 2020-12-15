variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = ""
}

variable "cidr" {
  description = "The cidr for the entire VPC."
  type        = string
  default     = "0.0.0.0/0"
}
