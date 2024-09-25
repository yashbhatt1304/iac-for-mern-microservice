output "vpc_id" {
  description = "This is VPC ID"
  value = aws_vpc.my_vpc.id
}

output "public_subnet_id" {
  description = "This is public subnet id"
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "This is private subnet id"
  value = aws_subnet.private_subnet.id
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