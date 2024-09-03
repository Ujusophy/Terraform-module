module "ec2_instance" {
  source = "./terraform-modules/ec2-instance"
  instance_type  = var.instance_type
  region = var.region
}

variable "region" {
  description = "The AWS region to deploy the instance in"
  default      = "us-east-1"
}

variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t2.micro"
}

