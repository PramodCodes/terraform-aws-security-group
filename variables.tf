variable "sg_name" {
  # if you dont assign it will be random unique name is assigned by terraform so its mandatory

}
variable "sg_description" { 
# this cannot be "" or empty due to some rquirement , watch session 32 at 31:00

}

variable "vpc_id" {

}

variable "common_tags" {
    default = {}
    type = map 
}

variable "sg_tags" {
    default = {}
    type = map 
}

variable "project_name" {

}

variable "environment" {

}

variable "sg_ingress_rules" { 
  # not mandatory so empty default block
  type = list
  default = []
}