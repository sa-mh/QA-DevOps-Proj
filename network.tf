resource "aws_internet_gateway" "taskGateway" {
  vpc_id = aws_vpc.taskVPC.id

  tags = {
    Name = "Task-Gateway"
  }
}

resource "aws_route_table" "taskTable" {
  vpc_id = aws_vpc.taskVPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.taskGateway.id
  }
  tags = {
    Name = "Task-Route-Internet-Subnet"
  }
}

resource "aws_route_table_association" "taskRouteAsso" {
  subnet_id      = aws_subnet.taskVPCSubnet.id
  route_table_id = aws_route_table.taskTable.id
}
