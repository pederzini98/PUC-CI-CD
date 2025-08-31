# Terraform AWS App

This project provisions AWS resources using Terraform. It creates a virtual machine instance, a security group with port 80 open, and a storage bucket.

## Project Structure

- `main.tf`: Contains the main configuration for provisioning AWS resources.
- `variables.tf`: Defines the input variables for the Terraform configuration.
- `outputs.tf`: Specifies the outputs of the Terraform configuration.
- `README.md`: Documentation for the project.

## Getting Started

### Prerequisites

- Terraform installed on your machine.
- AWS account with appropriate permissions.

### Initialization

To initialize the Terraform configuration, run the following command in the project directory:

```
terraform init
```

### Applying the Configuration

To apply the Terraform configuration and provision the resources, run:

```
terraform apply
```

### Outputs

After the resources are provisioned, you can view the outputs by running:

```
terraform output
```

This will display the public IP of the virtual machine and the URL of the storage bucket.