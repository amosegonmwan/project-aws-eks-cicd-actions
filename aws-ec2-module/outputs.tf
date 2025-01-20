output "ami_id" {
  description = "Ubuntu AMI ID from data source"
  value       = data.aws_ami.ubuntu.id
}

output "public_ip_with_http" {
  description = "Public IP address with HTTP and port 9000"
  value       = "http://${aws_instance.ec2-server.public_ip}:9000"
}

