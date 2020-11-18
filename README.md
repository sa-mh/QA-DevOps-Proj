Currently:
There is an 'external' VM that has both terraform and ansible installed.
2 VMs and 2 RDS's are created through terraform. 
1 of the VMs is part of the stretch goals however its creation was simple so has been done prematurely.
There are 3 Ansible playbooks that install docker & docker-compose, jenkins and pytest. Pytest also updates the VM.
The playbook that installs jenkins returns a file containing the initial jenkins password to the 'external' VM.
The playbooks and inventorys currently need to be updated with the IP addresses when the VMs are created before they can be ran.
The VMs are able to access the RDS's with the username 'root' and password 'password'.

To do:
Kubernetes,
Jenkins jobs,
Pytest,
Use of the RDS's,
AWS CLI on the jenkins machine.

Stretch goals:
Pytest on the second VM
Terraform creating the kubernetes cluster

Notes:
The code bank has some extra code which was to create a private subnet and ec2 from a task which has not been used or implemented at the current time.
