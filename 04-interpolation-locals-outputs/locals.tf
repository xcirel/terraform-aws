locals {
  ip_filepath = "ips.json"

  commom_tags = {
    Name        = "Course of Terraform"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Eric dos Santos"
  }
}