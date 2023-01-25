locals {
  ip_file_path = "ips.json"

  commom_tags = {
    Name        = "Course of Terraform"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Eric dos Santos"
    Stop        = "yes"
  }
}