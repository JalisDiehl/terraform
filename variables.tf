 
variable "region" {
  default     = "us-east-1"
  description = "Main region"
}

variable "ami" {
  default = "ami-035be7bafff33b6b6"
}

variable "type" {
    default = "t2.micro"
}

variable "ips" {
  type    = "list"
}
