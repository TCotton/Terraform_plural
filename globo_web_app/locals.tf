locals {
  common_tags = {
    company      = var.company_name
    project      = "${var.company_name}-${var.project_name}"
    billing_code = var.billing_code
  }
}

locals {
  # Define a map for instance sizes
  instance_sizes = {
    small  = var.aws_instance_sizes.small
    medium = var.aws_instance_sizes.medium
    large  = var.aws_instance_sizes.large
  }
}

