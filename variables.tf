variable "ami" {
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t3.small"
}

variable "vpc_security_group_ids" {
  default = [ "sg-0bd63930853a81d75" ]
}

variable "zone_id" {
  default  = "Z03794601KAQEDOI5X4Y"
}

variable "components" {
  default = {
    frontend = ""
    mongodb = ""
    mysql = ""
    rabbitmq = ""
    redis = ""
    catalogue = ""
    cart = ""
    user = ""
    shipping = ""
    payment = ""
  }
}