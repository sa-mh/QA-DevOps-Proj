resource "aws_subnet" "taskVPCSubnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"


  tags = {
    Name = "Task-Pub-Sub"
  }
}