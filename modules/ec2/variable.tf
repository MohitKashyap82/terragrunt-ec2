variable "ami" {
  description = "The ID of the AMI to launch"
}

variable "instance_type" {
  description = "Type of instance to launch"
}

variable "availablility_zone" {
  description = "The availability zone where the instance will be launched"
}

variable "instance_name" {
  description = "The name of the EC2 instance"
}

variable "ebs_block_device_name" {
  type        = string
  description = "The desired name of the EBS block device"
  default     = "/dev/xvda"
}

locals {
  user_data = <<-EOF
    #!/bin/bash
    hostname ${var.instance_name}
    curl -Os https://downloads.thousandeyes.com/agent/install_thousandeyes.sh -o install_thousandeyes.sh
    chmod +x install_thousandeyes.sh
    ./install_thousandeyes.sh ${local.account_key}
    EOF

  account_key = jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["thousandeyes-key"]
}
