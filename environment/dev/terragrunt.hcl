terraform {
    source = "../../modules/ec2///"
}

inputs = {
    ami = "ami-0a1179631ec8933d7"
    instance_type = "t2.micro"
    availablility_zone =  "us-east-1"
    instance_name = "Terragrunt-Dev"
}
