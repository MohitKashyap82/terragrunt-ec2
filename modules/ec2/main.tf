# Configure the AWS Provider
provider "aws" {
  region = var.availablility_zone
}

resource "aws_security_group" "main" {
  description = "Allow all inbound and outbound traffic"

  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]

  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    }
  ]
}

resource "aws_instance" "ec2_example" {
  ami           = var.ami
  instance_type = var.instance_type
  user_data     = local.user_data

  root_block_device {
    encrypted = true
  }

  tags = {
    Name       = var.instance_name
    CostCentre = "YOUR_COSTCENTRE_VALUE_HERE"
  }

  metadata_options {
    http_tokens = "required"
  }

  ebs_block_device {
    device_name           = var.ebs_block_device_name
    volume_size           = 50
    volume_type           = "gp2"
    encrypted             = true
    kms_key_id            = aws_kms_key.test_kms_key.key_id
    delete_on_termination = true
  }
}

