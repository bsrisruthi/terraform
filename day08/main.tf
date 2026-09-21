resource "aws_s3_bucket" "s3bucket" {
   count = length(var.bucket_name)
   bucket = var.bucket_name[count.index]
}

resource "aws_s3_bucket" "s3bucket2" {
  for_each = var.aws_bucket
  bucket = each.value
}