variable "region" {
  default = "us-east-1"
}

variable "environment" {
  default="dev"
}

variable "instance_count" {
  type = number
  description = "number of EC2 instances to create"
  default = 1
}

variable "monitoring_enabled" {
    type = bool
    default = true
  
}
variable "associate_public_ip" {
  type = bool
  default = true
}

variable "cidr_block" {
  type= list(string)
  default = [ "10.0.0.0/16", "10.0.0.0/12", "10.0.0.0/11" ]
}

variable "allowed_region" {
  type = set(string)
  default = [ "us-east-1", "us-west-2", "eu-west-1" ]
}

variable "tags" {
  type = map(string)
  default = {
    "environment" = "dev"
    "name"="dev-instance"
    created_by="terraform"
  }
}