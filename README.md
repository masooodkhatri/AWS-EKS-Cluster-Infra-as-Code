# 🚀 AWS EKS Cluster Infrastructure as Code

![AWS EKS](https://img.shields.io/badge/AWS%20EKS-Cluster-blue?style=flat-square&logo=amazonaws)

Welcome to the **AWS EKS Cluster Infrastructure as Code** repository! This project provides a robust Terraform configuration for deploying a production-ready Amazon EKS (Elastic Kubernetes Service) cluster on AWS. With customizable node groups and networking, this setup is designed to meet your cloud-native needs.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Customization](#customization)
- [Architecture](#architecture)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- **Production-Ready**: Deploy a fully functional EKS cluster tailored for production workloads.
- **Customizable Node Groups**: Define multiple node groups with different instance types and sizes.
- **Networking Options**: Easily configure VPC, subnets, and security groups.
- **Infrastructure as Code**: Manage your cloud resources with Terraform, ensuring reproducibility and version control.
- **Scalability**: Scale your applications effortlessly with Kubernetes orchestration.

## Getting Started

To get started with this repository, clone it to your local machine. Use the following command:

```bash
git clone https://github.com/masooodkhatri/AWS-EKS-Cluster-Infra-as-Code.git
```

### Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

### Configuration

1. **AWS Credentials**: Configure your AWS credentials using the AWS CLI:

   ```bash
   aws configure
   ```

2. **Terraform Variables**: Modify the `variables.tf` file to set your desired configurations, such as region, node types, and desired capacity.

3. **Initialize Terraform**: Navigate to the project directory and run:

   ```bash
   terraform init
   ```

4. **Plan the Deployment**: Check what Terraform will create:

   ```bash
   terraform plan
   ```

5. **Apply the Configuration**: Deploy the EKS cluster with:

   ```bash
   terraform apply
   ```

## Usage

Once your EKS cluster is up and running, you can manage your Kubernetes resources using `kubectl`. To connect to your cluster, run:

```bash
aws eks --region <region> update-kubeconfig --name <cluster_name>
```

Replace `<region>` and `<cluster_name>` with your specific values.

### Accessing the Dashboard

To access the Kubernetes dashboard, deploy it using the following command:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.5.1/aio/deploy/recommended.yaml
```

Then, create a service account and cluster role binding:

```bash
kubectl create serviceaccount dashboard -n kubernetes-dashboard
kubectl create clusterrolebinding dashboard-admin --clusterrole=cluster-admin --serviceaccount=kubernetes-dashboard:dashboard
```

To access the dashboard, run:

```bash
kubectl proxy
```

Then, visit [http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/) in your browser.

## Customization

This repository allows for extensive customization. Here are some key areas you can modify:

- **Node Group Configuration**: Adjust the instance types and scaling policies in the `node_groups.tf` file.
- **Networking**: Customize VPC settings in `vpc.tf` to fit your organization’s requirements.
- **IAM Roles**: Modify the IAM roles in `iam.tf` to grant the necessary permissions for your applications.

Feel free to explore the Terraform files and make adjustments as needed.

## Architecture

The architecture of this EKS cluster follows best practices for cloud-native applications. Here’s a brief overview:

- **VPC**: A dedicated Virtual Private Cloud with public and private subnets.
- **EKS Control Plane**: Managed by AWS, providing a highly available and scalable Kubernetes control plane.
- **Node Groups**: EC2 instances running the Kubernetes worker nodes.
- **Load Balancers**: Automatically provisioned to manage traffic to your applications.
- **Security Groups**: Configured to control inbound and outbound traffic to your resources.

![Architecture Diagram](https://example.com/architecture-diagram.png)

## Contributing

We welcome contributions to improve this project. If you have suggestions or enhancements, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature/YourFeature`).
6. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions or support, feel free to reach out:

- GitHub: [masooodkhatri](https://github.com/masooodkhatri)
- Email: masooodkhatri@example.com

## Releases

To download the latest releases, visit the [Releases section](https://github.com/masooodkhatri/AWS-EKS-Cluster-Infra-as-Code/releases). You can find the necessary files to execute and set up your EKS cluster.

---

Thank you for checking out this repository! We hope it helps you deploy your EKS cluster with ease. If you have any feedback or issues, please let us know. Happy coding!