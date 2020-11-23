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
AWS CLI on the jenkins machine,
Add user to docker group,
Kubectl on the jenkins machine.
Pytests tests in the directories 
Put RDS password&username into hidden vars file

Stretch goals:
Pytest on the second VM
Terraform creating the kubernetes cluster

Notes:
The code bank has some extra code which was to create a private subnet and ec2 from a task which has not been used or implemented at the current time.

https://sam-horner.atlassian.net/secure/RapidBoard.jspa?projectKey=DOP&rapidView=1&view=planning.nodetail&atlOrigin=eyJpIjoiMTg4NDQyMjkwZGM2NDU0OTk3OTg0MjllM2E2ZDI5YWUiLCJwIjoiaiJ9


Brief
 
The requirements set for the project are below:
 
Deploy the flask app to a virtual machine for testing
Deploy the app in a managed Kubernetes cluster for production
Use a managed database solution
 
The brief had the following contraints:
 
Kanban Board: Jira
Version Control: Git
CI Server: Jenkins
Configuration Management: Ansible
Cloud Server: AWS EC2
Database Server: AWS RDS
Containerisation: Docker
Reverse Proxy: NGINX
Orchestration Tool: Kubernetes
Infrastructure Management: Terraform

Project Tracking

The project management tool used to monitor the progress of the project was a Jira board. The project was organised into one sprint with three basic user stories which were also broken down into more specific tasks. Two of the three user stories were completed along with all of the tasks. One of the user stories "I want to be able to update my application with no down time"  is still in the 'In Progress' stage as there is a chance of the user experiencing some down time. This is elaborated on further in the future improvements section. 

Deployment

Terraform 

In it's current state, the entirety of the systems architecture is created and deployed via Terraform. The Terraform build create:

1 VPC
3 Subnets
2 Ubuntu EC2 VM's
1 EKS Cluster
1 EKS Node Group 
1 Internet Gateway
2 RDS Instances
1 Route Table
3 Route Table Associations
1 Security Group
1 Database Subnet Group

The infrastructure diagram reflects the overall system without subnets. The subnets are not included due to the amount of overlapping reducing readability.

Ansible

Through two Ansible playbooks, applications such as jenkins and docker are installed on the virtual machines. There is a different playbook for both the jenkins virtual machine and the pytest virtual machine. These playbooks are on the same virtual machine as the terraform files, as such, it is able to easily access both of the virtual machines immediately after their creation since the virtual machines public key is forwarded to the machines upon their creation.

Jenkins

Jenkins is installed on a virtual machine to make use of its pipeline. The pipeline, with the use of the Jenkinsfile, directs the flow of the initial and updated deployments of the app. The pipeline is responsible for starting the process of running the pytests and also pushing the application to the cluster. The job at the moment is split into only two stages, the first being the testing of the new app. To do these tests, the jenkins pipeline SSH's into the pytest virtual machine to test the new update and pushing the new docker images to dockerhub. Provided that is completed succesfully, the application will then be hosted onto the EKS cluster. 

Kubernetes

The application is hosted in an EKS with a node group of three containers. In these containers are the images for nginx, the frontend and the backend. There are then three identical pods within these containers with their respective images. There is also a load balancer in order to distribute traffic and prevent overloading, as well as cluster IPs for both the frontend and backend. These are internal IP addresses to the cluster. To minimise the potential downtime due to issues in the server region, the cluster is based in the three zones of the EU-West-1 (Republic of Ireland) servers. Spreading them accross the different zones reduces the chances of any downtime as it is unlikely that all three zones in the region go down at the same time, compared to if they were located in one zone where one server issue could take the app offline until the issue is sorted.

Application Instructions

Step by step instructions to start the terraforming process through to accessing the webpage can be found on a google doc here.

Known Issues

There are two main issues with the system in its current state, the first being that there is a lot of superfluous legacy code still being ran during some processes. This is most prevalent in the ansible playlists. There are lots of programs being installed through the playbook which are now unnesecary and as such should be removed as they increase the initial deployment time of the virtual machines as well as wasting memory space with their storage. 

The second main issue is that the updates to the application are not implement the available rollout functionality available through kubernetes. At the moment the jenkins file will delete all of the pods only for them to be immediately created again with the latest image. While this does achieve the desired result of updating the application, should a user attempt to access the frontpage or recieve an updated list from the backend, they would be unable to do so. While the overall downtime is small while the application is being updated, there is still a chance that the user will recieve a connection error should they attempt any functionality during this small timeframe. While this would be fixed with a refresh barely a second later, this is only due to the current small scale of the application. If the system were to be scaled up, the downtime would increase as it would have to create more pods.

Future Improvements
