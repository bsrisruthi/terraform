variable "project_name"{
    default="Project Terraform"
}

variable "default_tags" {
    default = {
        company = "my-company"
        managed_by = "terraform"
    }
  
}

variable "environment_tags" {
    default = {
        environment = "pre-prod"
        cost_center = "cc-231"
    }
  
}

 variable "allow_ports" {
    default = "80,443,8080,3306"
   
 }