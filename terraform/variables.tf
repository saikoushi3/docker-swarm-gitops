variable "aws_region" {
  description = "The AWS region to create resources in."
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The EC2 instance type."
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI to use for the EC2 instances (ubuntu 22)."
  default     = "ami-053b0d53c279acc90" # Update with a current ubuntu 22 AMI in your region
}

variable "key_name" {
  description = "The name of your EC2 key pair."
  # Add your EC2 key pair name here
  default     = "key-pair"
}