resource "aws_security_group" "ssh" {
  name        = "day10-ssh-sg"
  description = "Allow SSH access from my Mac"

  ingress {
    description = "SSH from my Mac"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    # Replace this with your public IP
    cidr_blocks = ["130.41.181.71/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "day10-ssh-sg"
  }
}



resource "aws_instance" "my-instance" {
  ami      = "ami-0e8459476fed2e23b"
  count    = var.instance_count
  key_name = "day10-key"


  instance_type = var.environment == "dev" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [
    aws_security_group.ssh.id
  ]

  tags = var.tags
}

