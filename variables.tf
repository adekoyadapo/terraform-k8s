variable "name_prefix" {
  description = "name prefix"
}

variable "location" {
  description = "location"
}

variable "cidr" {
  description = "cidr"
}

variable "cp_count" {
  default = 0
}
variable "k8s_version" {
  default = "1.19.13"
}
