# terraform-kubernetes
This Terraform project automates the deployment of an AWS infrastructure with a Kubernetes cluster (EKS) for hosting a development environment in the ap-south-1 region. It creates a VPC with public and private subnets, provisions an EKS cluster named "myapp-eks," and configures a Kubernetes provider for easy application deployment and scaling.
This Terraform project is designed to automate the provisioning and configuration of an Amazon Web Services (AWS) infrastructure for hosting a Kubernetes cluster. The infrastructure includes a Virtual Private Cloud (VPC), subnets, and necessary components for the deployment of a Kubernetes cluster.

Components and Modules:

AWS Configuration:

The project starts by configuring the AWS provider, setting the region to "ap-south-1."
VPC Creation:

The myapp-vpc module provisions a Virtual Private Cloud (VPC) for the project. It uses the terraform-aws-modules/vpc/aws module version 5.1.2.
The VPC is named "myapp-vpc" and is configured with the specified CIDR block.
Availability Zones (AZs) are automatically determined using AWS data sources.
The VPC includes public and private subnets with user-defined CIDR blocks.
NAT Gateways are enabled for private subnets to facilitate outbound internet access.
DNS hostnames are enabled for the VPC.
Resource tags are added for easy identification and management.
Kubernetes Cluster Configuration:

The eks module provisions an Amazon Elastic Kubernetes Service (EKS) cluster.
The EKS cluster is named "myapp-eks" and is running Kubernetes version 1.22.
It is associated with the VPC created by the myapp-vpc module and uses its private subnets.
Resource tags are added for identification and organization.
A managed node group named "dev" is created, with specific instance type configurations, ensuring redundancy with minimum, maximum, and desired sizes.
Kubernetes Provider Configuration:

A Kubernetes provider is configured to connect to the EKS cluster using the necessary authentication information from AWS data sources.
Purpose:

The primary purpose of this IaC project is to streamline the creation and management of an AWS infrastructure and Kubernetes cluster for hosting a development environment. The project ensures that the infrastructure components are provisioned with best practices and follows a tagged and organized structure for efficient resource management.

Usage:

Execute this Terraform script to create the AWS VPC, subnets, and EKS cluster.
After provisioning, Kubernetes applications can be deployed and managed within the EKS cluster, allowing for easy scaling and maintenance of containerized workloads. 


<img width="1108" alt="Screenshot 2023-10-17 at 3 45 04 AM" src="https://github.com/Tushar240503/terraform-kubernetes/assets/98592305/867435f1-ab01-4ea7-a052-ce4adcb1fbf3">



<img width="1440" alt="Screenshot 2023-10-17 at 3 45 16 AM" src="https://github.com/Tushar240503/terraform-kubernetes/assets/98592305/9bf3a7b7-2dd6-447c-9536-4d693ab332fd">



