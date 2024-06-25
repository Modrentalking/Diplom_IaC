# Diplom_IaC
## Infrastructure as Code with Terraform

This repository contains code for deploying infrastructure using Terraform. It creates a Kubernetes cluster in Google Cloud with two node pools: a default node pool for deploying the Hello World HTTP Server application and a logging node pool for logging this application.

![alt text](https://developer.hashicorp.com/_next/image?url=https%3A%2F%2Fcontent.hashicorp.com%2Fapi%2Fassets%3Fproduct%3Dtutorials%26version%3Dmain%26asset%3Dpublic%252Fimg%252Fterraform%252Fautomation%252Ftfc-gh-actions-workflow.png%26width%3D1888%26height%3D518&w=1920&q=75)
## Prerequisites

Before running the Terraform code, make sure you have the following:

- A Google Cloud Platform (GCP) account
- GCP credentials in JSON format (provide the credentials in the `GCP_CREDENTIALS` environment variable)
- Variables:
  - `GCP_REGION`: the GCP region where the cluster will be created
  - `GCP_PROJECT`: the name of the GCP project
  - `CLUSTER_NAME`: the name of the Kubernetes cluster

## Google Cloud Storage Bucket

To store the Terraform state, you need to create a Google Cloud Storage bucket. If you are creating the bucket in another project, grant access permissions to your service account using the following command:
   ```shell
   gsutil acl ch -u <service accoiunt>:FC gs://<name of bucket>    
```

## GitHub Actions Pipeline

This repository includes a GitHub Actions pipeline for automatic infrastructure deployment. The pipeline consists of the following stages:

1. `terraform init`: Initializes Terraform and sets up the backend for storing the state.
2. `terraform plan`: Generates an execution plan for creating the infrastructure.
3. Manual `terraform apply`: Applies the changes to create the infrastructure. This step requires manual intervention.
