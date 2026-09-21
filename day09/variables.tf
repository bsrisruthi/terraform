variable "Environment" {
  default = "prod"
}

variable "resource_tags" {
  description = "Common types of resources"  
  type = map(string)
  default = {
    "Environment" = "Prod"
    "Team" = "DevOps"
    "CostCentre" = "ERPCD"
  }
}

variable "allowed_Regions" {
  type = list(string)
  default = [ "us-west-1", "eu-west-2" ]
}