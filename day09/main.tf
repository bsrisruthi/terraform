# DATA SOURCES

data "aws_ami" "amazon_linux_ami" {
  most_recent = true
  owners = [ "amazon" ]
   filter {
     name = "name"
     values = [ "amzn2-ami-hvm-*-x86_64-gp2" ]
   }
}

# AWS REGION

data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
  exclude_names = [
    "us-east-1e"
  ]
}

# CREATE BEFORE DESTROY
/*
resource "aws_instance" "example" {
  ami = data.aws_ami.amazon_linux_ami.id
  instance_type = "t4g.micro"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name= "ec2_INSTANCE"
    Environment="Dev"
    Region= data.aws_region.current.name
  }
  lifecycle {
    create_before_destroy = true
  }
}


#PREVENT BEFORE DESTROY

resource "aws_s3_bucket" "critical_bucket" {
  bucket = "my-bucket-critical-108-${var.Environment}-342"
  tags = merge(
    var.resource_tags,
    {
      Name= "Critical Prod bucket"
      Demo = "prevent_destroy"
      DataType= "critical"
    }
  )
  lifecycle {
    prevent_destroy = true
  }
}



resource "aws_launch_template" "app_server" {
  name_prefix   = "app-server-"
  image_id      = data.aws_ami.amazon_linux_ami.id
  instance_type = "t3.micro"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "App Server"
    }
  }
}


resource "aws_autoscaling_group" "app_servers" {
  name = "app-servers-asg"
  min_size = 1
  max_size = 5
  desired_capacity = 2
  health_check_type = "EC2"
  availability_zones = data.aws_availability_zones.available.names
  launch_template {
    id      = aws_launch_template.app_server.id
    version = "$Latest"
  }

  tag {
    key = "Name"
    value = "App server ASG"
    propagate_at_launch = "true"
  }

  tag {
  key                 = "Demo"
  value               = "ignore_changes"
  propagate_at_launch = false
}

  lifecycle {
    ignore_changes = [ 
      desired_capacity,
     ]
  }
}
*/

# PRE CONDITION

resource "aws_s3_bucket" "regional_validation"{
 bucket = "validated-${var.Environment}-${data.aws_region.current.name}"
 tags = {
   Name="validated bucket"
   Demo="Precondition"
 }
 lifecycle {
   precondition {
     condition = contains(var.allowed_Regions,data.aws_region.current.name)
     error_message = "ERROR: This can only be created in: ${join(",",var.allowed_Regions)}.Current region:${data.aws_region.current.name}"
   }
 }
}
