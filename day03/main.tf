terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


# Create S3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "sruthi-bucket-24111999"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
