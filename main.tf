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

#######  Public Subnet in Availability Zone 1  ########
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"  # Choose your preferred AZ

  tags = {
    Name = "PublicSubnet"
    Application = var.mern_application_tag 
  }
}

#######  Private Subnet in Availability Zone 1  ########
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "PrivateSubnet"
    Application = var.mern_application_tag 
  }
}

#######  Internet Gateway for Public Subnet  ########
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "MyIGW"
    Application = var.mern_application_tag
  }
}

