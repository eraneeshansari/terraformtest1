variable "region" {
  type        = string
  description = "description"
}

variable "keyname" {
  type        = string
  description = "description"
}

variable "instancetype" {
  type        = string
  description = "description"
}
variable "instance_count" {
  type    = number
}

variable "prod_sg_rule" {
  type = map(string)

 default = {
    "81" = "0.0.0.0/0"
    "82" = "0.0.0.0/0"
    "83" = "0.0.0.0/0"
  }
#this is test code added
}

