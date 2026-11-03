variable "region" {
  type        = string
  description = "Sets the region, eg. eu-west-1"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Sets the instance type, eg. t3.micro"
}

variable "ssh_cidr" {
  type        = string
  description = "My public IP in CIDR notation, e.g. 1.2.3.4/32"

  validation {
    condition     = can(cidrhost(var.ssh_cidr, 0))
    error_message = "my_ip must be a valid CIDR, e.g. 1.2.3.4/32."
  }
}