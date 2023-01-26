variable "name" {

  type = string

  description = "Bucket name"

}

variable "acl" {
  type = string

  description = ""

  default = "private"

}


variable "policy" {

  type = string

  description = ""

  default = null

}

variable "tags" {

  type = map(string)

  description = ""

  default = {}

}


variable "website" {

  type = map(string)

  description = "Map containing website configuration"

  default = {}

}