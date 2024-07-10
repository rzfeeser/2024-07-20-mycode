# this is now an "input" value
variable "loc" {
  type    = string
  default = "westus2"
}

# this is now an "input" value
variable "dynamic_name" {
  type    = string
  default = "myTFResourceGroup_for_zach"
}

# this is now an "input" value
variable "netname" {
  type    = string
  default = "example-network"
}

# this is now an "input" value
variable "netspace" {
  type    = list
  default = ["10.0.0.0/16"]
}
