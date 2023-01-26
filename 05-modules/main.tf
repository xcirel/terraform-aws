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


resource "random_pet" "this" {

  length = 5

}


module "bucket" {

  source = "./s3_module"

  name = random_pet.this.id

}


resource "random_pet" "website" {

  length = 5

}

module "website" {

  source = "./s3_module"

  name = random_pet.website.id

  website = {

    index_document = "index.html"

    error_document = "error_document.html"
  }

  policy = <<EOT
    {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "PublicReadGetObject",
              "Effect": "Allow",
              "Principal": "*",
              "Action": [
                  "s3:GetObject"
              ],
              "Resource": [
                  "arn:aws:s3:::${random_pet.website.id}/*"
              ]
          }
      ]
    }
  EOT



}