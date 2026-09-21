terraform{
    required_providers {
      aws={
        source  = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}
 # Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

variable "environment" {
  default = "staging"
  
}

variable "bucket_name" {
  default = "dev-43512"
  
}

locals {
  common_tags={
    Environment= var.environment
  }
  
  full_bucket_name = "${var.environment}-${var.bucket_name}-bucket"
}

output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.demo.bucket
}

 resource "aws_s3_bucket" "demo" {
  bucket = var.bucket_name  # Using input variable
  
  tags = {
    Environment = var.environment  # Using input variable
  }
}
 
