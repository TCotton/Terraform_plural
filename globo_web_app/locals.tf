locals {
  common_tags = {
    company      = var.company
    project      = "${var.company}-${var.project}"
    billing_code = var.billing_code
  }

  s3_bucket_name = lower("${var.naming_prefix}-${var.environment}-webapp-${random_integer.s3.result}")
  website_content = {
    "index.html"          = file("${path.module}/website/index.html")
    "Globo_logo_Vert.png" = filebase64sha256("${path.module}/website/Globo_logo_Vert.png")
  }

  naming_prefix = "${var.naming_prefix}-${var.environment}"
}
resource "random_integer" "s3" {
  min = 10000
  max = 99999
}

