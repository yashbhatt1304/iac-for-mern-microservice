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