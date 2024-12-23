variable "sg_name" {
  # if you dont assign it will be random unique name is assigned by terraform so its mandatory

}
variable "sg_description" { # lets make it optional by including default "" mandatory things are undefined
    type = string
    default = ""
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