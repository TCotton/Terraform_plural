variable "aws_access_key" {
  type        = string
  description = "AWS Access Key"
  sensitive   = true
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Key"
  sensitive   = true
}

variable "aws_region" {
  type        = string
  description = "Region for AWS Resources"
  default     = "us-east-1"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR Block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_public_subnet_count" {
  type        = number
  description = "Number of Public Subnets to create"
  default     = 2
}

variable "vpc_public_subnets_cidr_block" {
  type        = list(string)
  description = "CIDR Block for Public Subnets in VPC"
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}
#"10.0.0.0/24" / "10.0.1.0/24"

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}

variable "instance_type" {
  type        = string
  description = "Type for EC2 Instance"
  default     = "t3.micro"
}

variable "instance_count" {
  type        = number
  description = "Number of EC2 Instances to create"
  default     = 2
}

variable "company" {
  type        = string
  description = "Company name for resource tagging"
  default     = "Globomantics"
}

variable "project" {
  type        = string
  description = "Project name for resource tagging"
  default     = "WebApp"
}

variable "billing_code" {
  type        = string
  description = "Billing code for resource tagging"
  default     = "WEBAPP-001"
}

variable "stage_name" {
  type        = string
  description = "Stage name (e.g. dev, prod)"
  default     = "dev"
}

variable "naming_prefix" {
  type        = string
  description = "Prefix for resource names"
  default     = "globo-web-app"
}

variable "environment" {
  type        = string
  description = "Environment for the application (e.g. dev, prod)"
  default     = "dev"
}
