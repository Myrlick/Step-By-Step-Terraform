variable "region" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ip" {
  type        = string
  description = "My public IP in CIDR notation, e.g. 1.2.3.4/32"

  validation {
    condition     = can(cidrhost(var.ip, 0))
    error_message = "my_ip must be a valid CIDR, e.g. 1.2.3.4/32."
  }
}