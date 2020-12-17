variable "number_of_ec2" {
  description = "Number of ec2 instances to create."
  type        = number
  default     = 0
}

variable "ami_id" {
  description = "The id of the ami."
  type        = string
  default     = "self"
}

variable "subnet_ids" {
  description = "The list of subnet ids."
  type        = list(string)
  default     = []
}

variable "private_ips" {
  description = "The list of private ips."
  type        = list(string)
  default     = []
}

variable "instance_type" {
  description = "The type of the instance to start. Default is t2.micro."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for the instance."
  type        = string
  default     = ""
}

variable "security_groups" {
  description = "The list of security groups names or ids."
  type        = list(string)
  default     = []
}

variable "instance_name" {
  description = "The name for the instance."
  type        = string
  default     = ""
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = ""
}
