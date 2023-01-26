resource "aws_s3_bucket" "this" {

  bucket = var.name

  acl = var.acl

  policy = var.policy

  tags = var.tags


  dynamic "website" {

    for_each = length(keys(var.website)) == 0 ? [] : [var.website]

    content {

      index_document = lookup(website, "index_document", null)

      error_document = lookup(website, "error_document", null)

      redirect_all_requests_to = lookup(website, "redirect_all_requests_to", null)

      routing_rules = lookup(website, "routing_rules", null)

    }

  }

  website {

    index_document = "index.html"

    error_document = "index.html"
  }

}