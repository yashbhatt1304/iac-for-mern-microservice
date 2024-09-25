terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.68.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

########  Configuring VPC  #########
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"  # CIDR range for the VPC
  tags = {
    Name = "MyVPC"
    Application = var.mern_application_tag 
  }
}