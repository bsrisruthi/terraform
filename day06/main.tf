resource "aws_vpc" "sample" {
    cidr_block = "10.0.0.0/16"
  tags = {
    Name = local.vpc_name
    Environment= var.environment
  }
}


resource "aws_s3_bucket" "my-bucket" {
  bucket = local.bucket_name
}