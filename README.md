# Terraform EC2 Instance Module

This repository contains a Terraform module for deploying an EC2 instance on AWS. The module is designed to be reusable across different environments (e.g., `dev`, `staging`, `production`) and supports versioning for controlled deployment.

### Module Structure

This repository is organized into the following directories:

- `terraform-modules/`: Contains the EC2 instance module.
- `environments/`: Contains environment-specific configurations (`dev`, `staging`, `production`).

### Using the Module

To use the EC2 instance module in an environment, navigate to the desired environment directory (`dev`, `staging`, `production`) and apply the Terraform configuration.

Example for `dev` environment:

```hcl
module "ec2_instance" {
  source        = "../terraform-modules/ec2-instance"
  instance_type = "t2.micro"
  region        = "us-east-1"
}
```

### Deploying the Configuration
```hcl
terraform init
terraform apply
```

### Module Versioning
To ensure consistent deployments, you can use versioning with your Terraform module. Versioning allows you to control which version of the module is used in different environments.

Tagging the Module
To create a version of your module, tag the module in your GitHub repository

```
git tag v1.0.0
git push origin v1.0.0
```

Referencing a Specific Version
In your environment configuration, you can reference a specific version of the module by using the ref parameter in the source attribute.

```hcl
module "ec2_instance" {
  source        = "git::https://github.com/Ujusophy/Terraform-modules.git//ec2-instance?ref=v1.0.0"
  instance_type = "t2.micro"
  region        = "us-east-1"
}
```
This ensures that Terraform uses the specified version (v1.0.0) of the module when deploying the infrastructure.

### Environments
This repository supports deploying infrastructure across different environments, each with its own configuration.

Example Environment Directory Structure
```
environments/
├── dev/
│   ├── main.tf
├── staging/
│   ├── main.tf
├── prod/
    ├── main.tf
```

### Deploying to Multiple Environments
To deploy the infrastructure in a different environment, navigate to the appropriate directory (e.g., environments/staging) and run terraform init followed by terraform apply.
Example: Deploying in the dev Environment
```hcl
cd environments/dev
terraform init
terraform apply
```


### Instructions
Replace `"https://github.com/your-username/terraform-modules.git"` with the actual URL of your GitHub repository.
