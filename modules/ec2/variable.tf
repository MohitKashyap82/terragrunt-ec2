variable "ami" {
    description = "The ID of the AMI to launch" 
}

variable "instance_type" {
    description = "Type of instance to launch" 
}

variable "availablility_zone" {

}

variable "instance_name" {

}

variable "user_data_script" {
  default = <<-EOF
            #!/bin/bash
            curl -Os https://downloads.thousandeyes.com/agent/install_thousandeyes.sh -o install_thousandeyes.sh
            chmod +x install_thousandeyes.sh
            sudo ./install_thousandeyes.sh ${}
            EOF
}

variable "ebs_block_device_name" {
    type = string 
    description = "The desired name of the EBS block device"
    default = "/dev/xvda"

}

locals {
    user_data = <<-EOF
            #!/bin/bash
            curl -Os https://downloads.thousandeyes.com/agent/install_thousandeyes.sh -o install_thousandeyes.sh
            chmod +x install_thousandeyes.sh
            sudo ./install_thousandeyes.sh ${locals.account_key}
            EOF
    
    account_key = jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["thousandeyes_key"]


}