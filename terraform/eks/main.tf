resource "aws_eks_cluster" "project_cluster" {
    name = "project_cluster"
    role_arn = "arn:aws:iam::845508719419:role/EKS-SR"
    version = "1.17"
    vpc_config {
        subnet_ids =  var.rds_subnet_grp_id
        security_group_ids = var.security_group_ids
    }
}

resource "aws_eks_node_group" "node_group" {
    name = aws_eks_cluster.project_cluster.name
    cluster_name = "project_cluster"
    node_group_name = "node_group check after"
    node_role_arn = "arn:aws:iam::845508719419:role/NodeRole"
    subnet_ids = var.rds_subnet_grp_id
    ami_type = "AL2_x86_64"
    instance_types = ["t3.small"]
    scaling_config {
        desired_size = "3" 
        max_size = "3"
        min_size = "3"
    }
}