output "ec2_id" {
  value = aws_instance.demo.id
}
output "ec2-ip" {
  value = aws_instance.demo.public_ip
}
