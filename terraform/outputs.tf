output "instance_id" {
  description = "ID of the MediCare EC2 instance"
  value       = aws_instance.medicare_server.id
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.medicare_server.public_ip
}

output "public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.medicare_server.public_dns
}