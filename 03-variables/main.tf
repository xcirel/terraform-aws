terraform {
  required_version = "1.3.7"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.51.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "terraform"
}

resource "aws_instance" "web" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t3.micro"

  tags = {
    Name = "ThanksAWS"
    Poc = "Terraform"
  }
}