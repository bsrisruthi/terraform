variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Name        = "dev-instance"
    created_by  = "sruthi"
    compliance  = "yes"

  }
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number

}

variable "environment" {
  description = "Environment name(dev or prod)"
  type        = string
  default     = "dev"

}

