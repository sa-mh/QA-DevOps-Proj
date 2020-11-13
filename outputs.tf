output "ec2-ip" {
  value = aws_instance.demo.public_ip
}