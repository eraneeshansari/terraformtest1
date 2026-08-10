variable "region" {
  type        = string
  default     = "us-east-1"
  description = "description one...."
}

variable "keyname" {
  type        = string
  default     = "pri_us"
  description = "description"
}

variable "instancetype" {
  type        = string
  default     = "t2.micro"
  description = "description"
}
variable "instance_count" {
  type    = number
  default = 1
}

variable "prod_sg_rule" {
  type = map(string)

  default = {
    "81" = "0.0.0.0/0"
   # "82" = "0.0.0.0/0"
   # "83" = "0.0.0.0/0"
  }
}

