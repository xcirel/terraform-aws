variable "aws_region" {
  type = string
  description = ""
  default = "us-east-1"
}

variable "aws_profile" {
  type = string
  description = ""
  default = "terraform"
}

variable "instance_ami" {
  type = string
  description = ""
  default = "ami-00874d747dde814fa"
}

variable "instance_type" {
  type = string
  description = ""
  default = "t3.micro"
}

variable "instance_tags" {
  type = map(string)
  description = ""
  default = {
    Name = "Ubuntu"
    Project = "Curso Terraform AWS"
    Stop = "yes"
  }
}

variable "instance_keyname" {
  type = string
  description = ""
  default = "terraform"

}