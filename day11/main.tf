locals{
    formatted_project_name=lower(replace(var.project_name," ","-"))
    port_list = split(",","var.allow_ports")
    sg_rules = [ for port in local.port_list : 
    {
        name="port-${port}"
        port = port
        description = "Allow traffic on port ${port}"
    } 
    ]
}
resource "aws_s3_bucket" "my-s3-bucket" {
    bucket= "sruthibucket-afgh"
    tags = merge(var.default_tags,var.environment_tags)

    

}