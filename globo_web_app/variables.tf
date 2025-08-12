variable "aws_access_key" {
  type        = string
  description = "AWS access key"
  sensitive   = true
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret key"
  sensitive   = true
}

variable "aws_region" {
  type        = list(string)
  description = "AWS region"
  default     = ["us-east-1", "us-west-2"]
}

variable "aws_instance_sizes" {
  type        = map(string)
  description = "Instance sizes to use in AWS"
  default = {
    small  = "t3.micro"
    medium = "t3.small"
    large  = "t3.medium"
  }
}

variable "aws_vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_public_subnets_cidr_block" {
  type        = list(string)
  description = "CIDR Block for Public Subnets in VPC"
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "aws_app_route_table_cidr" {
  type        = string
  description = "CIDR block for the app route table"
  default     = "0.0.0.0/0"
}

variable "company_name" {
  type        = string
  description = "Company name"
  default     = "Globo"
}

variable "project_name" {
  type        = string
  description = "Project name"
  default     = "WebApp"
}

variable "billing_code" {
  type        = string
  description = "Billing code for the project"
  default     = "WEBAPP-001"
}
