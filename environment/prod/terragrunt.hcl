terraform {
    source = "../../modules/ec2/"
}

inputs = {
    ami = "ami-04e5276ebb8451442"
    instance_type = "t2.micro"
    availablility_zone =  "us-east-1"
    instance_name = "Terragrunt Prod1"
}
