# terraform1
Ansible installs docker, docker compose, pytest and jenkins. The jenkins is returned to the VM in the terra1/ansible/returns directory.
The ansible playbook and inventory need to be updated with the new IP each time terraform apply is used in order to work.
Code bank has some extra code in there which was going to be used for creating a private subnet and EC2. It has not been used or tested as of yet.