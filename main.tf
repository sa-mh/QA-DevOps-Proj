provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
}

resource "aws_instance" "demo" {
  ami                         = var.ami-ROI
  instance_type               = var.type
  key_name                    = "terraKey"
  associate_public_ip_address = "true"
  subnet_id                   = aws_subnet.taskVPCSubnet.id
  vpc_security_group_ids      = [aws_security_group.taskSSH.id]
}

resource "aws_key_pair" "sshKeyGen" {
  key_name   = "terraKey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDS3Oy5bAUbmbV+Ne0rvBqJ2ex4+1ubjC5Y/pHPAMKRybpn46d1S779FzJMrc2BOvuUPTOLOrtXPzbFevNfndO136RLHxm1lPd9GnUHbISh4ST6Jms22W6y93bWN/Gqja6wOg2wdYmNmWp2PO23lHf/f1AJn8Ik8CDmyxdpW5sUG5IO5Co8z+9smdqz+W6qaOaohoyIKU43UFzhs54fjKVQGm3k7cspLNRi5BGjn2FQkVyXZV4zRBvYEOm/BpTh4fBTYvAYKA28V1dQNyu4KLZvbFg4U8nqLhgVP196JdAOlgLWlQdyJZYhKJQyHeQHE4XXJBvCcdBXMxCgYZC//6Nz ubuntu@ip-172-31-35-206"
}




