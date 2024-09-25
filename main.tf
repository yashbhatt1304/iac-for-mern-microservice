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

######  Public Route Table  #######
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"  # Route all outbound traffic to the internet
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "PublicRouteTable"
    Application = var.mern_application_tag
  }
}

#########  Associate Public Subnet with the Route Table  #########
resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# Security Group for Public Instances
resource "aws_security_group" "public_sg" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 80   # Allow HTTP traffic
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "PublicSecurityGroup"
    Application = var.mern_application_tag
  }
}