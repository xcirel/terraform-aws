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

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-tf-test-bucket-devops-lab-9043943867346743"
  acl = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby = "Terraform"
  }
}

# resource "aws_s3_bucket_acl" "example" {
#   bucket = aws_s3_bucket.b.id
#   acl    = "private"
# }