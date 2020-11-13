provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
}
resource "aws_key_pair" "sshKeyGen" {
  key_name   = "terraKey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDS3Oy5bAUbmbV+Ne0rvBqJ2ex4+1ubjC5Y/pHPAMKRybpn46d1S779FzJMrc2BOvuUPTOLOrtXPzbFevNfndO136RLHxm1lPd9GnUHbISh4ST6Jms22W6y93bWN/Gqja6wOg2wdYmNmWp2PO23lHf/f1AJn8Ik8CDmyxdpW5sUG5IO5Co8z+9smdqz+W6qaOaohoyIKU43UFzhs54fjKVQGm3k7cspLNRi5BGjn2FQkVyXZV4zRBvYEOm/BpTh4fBTYvAYKA28V1dQNyu4KLZvbFg4U8nqLhgVP196JdAOlgLWlQdyJZYhKJQyHeQHE4XXJBvCcdBXMxCgYZC//6Nz ubuntu@ip-172-31-35-206"
}
module "ec2" {
  source             = "./ec2"
  subnet_id          = module.subnets.subnet_id
  security_group_ids = [module.securitygroups.ssh_id]
}
module "gateway" {
  source = "./gateway"
  vpc_id = module.vpc.vpc_id
}
module "routetable" {
  source     = "./routetable"
  vpc_id     = module.vpc.vpc_id
  gateway_id = module.gateway.gateway_id
  subnet_id  = module.subnets.subnet_id
}
module "securitygroups" {
  source = "./securitygroups"
  vpc_id = module.vpc.vpc_id
}
module "subnets" {
  source = "./subnets"
  vpc_id = module.vpc.vpc_id
}
module "vpc" {
  source = "./vpc"
}



