resource "aws_instance" "sample" {
  ami = "ami-0e8459476fed2e23b"
  region = var.region
  count = var.instance_count
  instance_type = "t2.micro"
  monitoring = var.monitoring_enabled
  associate_public_ip_address = var.associate_public_ip
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.environment}-resource-name"
}

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block[0]
 tags = var.tags
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block[1]

  tags = {
    Name = "subnet-1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block[2]

  tags = {
    Name = "subnet-2"
  }
}