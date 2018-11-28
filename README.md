# AWS Testbed deployment using Terraform

Use Terraform to deploy a VPC, Security Group, ELB, keys, instances and S3 Buckets to and AWS Region across three availability zones to serve as a foundation for various testbed and lab projects. All required IDs are outputted for the user's future utilization. All resources are tagged with a delete tag if the user decides to remove the resources using another method such as Ansible instead of using Terraform Destroy.

### Prerequisites

Hashicorp Terraform and a AWS Account

### Note

This Terraform script is a template to do most of the grunt work for creating an environment in AWS for demonstration or testing purposes.
