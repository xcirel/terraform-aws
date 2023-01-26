terraform {

  required_version = "1.3.7"

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "4.51.0"

    }

  }

}


provider "aws" {

  region  = "us-east-1"

  profile = "terraform"

}


resource "random_pet" "this" {

    length = 5
  
}