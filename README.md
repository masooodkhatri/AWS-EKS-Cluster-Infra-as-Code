# AWS EKS Cluster Terraform Project

This project contains Terraform configuration to deploy an Amazon EKS (Elastic Kubernetes Service) cluster on AWS. It sets up the necessary infrastructure including VPC, subnets, and node groups to run a Kubernetes cluster.

## Architecture

The project creates the following resources:

- **VPC**: A dedicated VPC for the EKS cluster
- **Subnets**: Public subnets across multiple availability zones
- **EKS Cluster**: Kubernetes control plane managed by AWS
- **EKS Node Group**: Worker nodes that run your Kubernetes applications
- **IAM Roles and Policies**: Necessary permissions for the cluster and nodes
- **Security Groups**: Network security rules for the cluster and nodes

## Prerequisites

Before you begin, ensure you have:

1. [Terraform](https://www.terraform.io/downloads.html) installed (version 1.0.0 or newer)
2. [AWS CLI](https://aws.amazon.com/cli/) installed and configured with appropriate credentials
3. [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) (optional, for interacting with the cluster)

## Configuration

The main configuration files are:

- `main.tf`: Contains the main Terraform configuration for the EKS cluster and VPC
- `variables.tf`: Defines input variables for the configuration
- `output.tf`: Defines output values that are displayed after applying the configuration

## Usage

### Initialize Terraform

```bash
terraform init
```

### Preview Changes

```bash
terraform plan
```

### Apply Changes

```bash
terraform apply
```

When prompted, type `yes` to confirm the creation of resources.

### Configure kubectl

After the cluster is created, you can configure kubectl to interact with your cluster:

```bash
aws eks update-kubeconfig --region $(terraform output -raw region) --name $(terraform output -raw cluster_name)
```

### Destroy Resources

When you're done with the cluster, you can destroy all resources:

```bash
terraform destroy
```

## Customization

You can customize the deployment by modifying the following variables:

- `region`: AWS region to deploy the cluster (default: us-east-1)
- Edit `main.tf` to change:
  - Cluster name
  - Kubernetes version
  - Node instance types
  - Node group size
  - VPC CIDR and subnet configuration

## Security Considerations

This configuration creates a public EKS cluster with nodes in public subnets. For production environments, consider:

1. Adding private subnets and placing nodes there
2. Adding NAT gateways for outbound connectivity
3. Restricting cluster endpoint access with CIDR blocks
4. Using larger instance types for production workloads
5. Implementing additional security controls

## Troubleshooting

If you encounter issues:

1. Ensure your AWS credentials are correctly configured
2. Check that you have sufficient permissions to create all required resources
3. Verify that your AWS region supports EKS
4. Review the Terraform and AWS provider versions

## License

See the [LICENSE](LICENSE) file for details.
