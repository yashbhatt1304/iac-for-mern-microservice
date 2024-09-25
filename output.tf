output "vpc_id" {
  description = "This is VPC ID"
  value = aws_vpc.my_vpc.id
}

output "public_subnet_id_AZ1" {
  description = "This is public subnet id for AZ1"
  value = aws_subnet.public_subnet-az1.id
}

output "public_subnet_id_AZ2" {
  description = "This is public subnet id for AZ2"
  value = aws_subnet.public_subnet-az2.id
}

output "private_subnet_id_AZ1" {
  description = "This is private subnet id for AZ1"
  value = aws_subnet.private_subnet-az1.id
}

output "private_subnet_id_AZ2" {
  description = "This is private subnet id for AZ2"
  value = aws_subnet.private_subnet-az2.id
}

output "internet_gateway" {
  description = "This is internet gateway"
  value = aws_internet_gateway.my_igw.id
}

output "route_table_id" {
  description = "This is route table id"
  value = aws_route_table.public_route_table.id
}

output "route_table_id" {
  description = "This is route table id"
  value = aws_route_table.public_route_table.id
}

output "security_group_id" {
  description = "This is security group id"
  value = aws_security_group.public_sg.id
}