variable "bucket_name" {
  default = ["myph-1bucket-1","myph-2bucket-2"]
  type = list(string)
}

variable "aws_bucket" {
  type = set(string)
  default = [ "mine-124-bucket","mine-132-bucket" ]
}