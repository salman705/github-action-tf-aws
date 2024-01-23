# variables.tf

variable "region" {
  description = "The AWS region where EC2 instances will be created."
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch."
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI ID for the EC2 instances."
  type        = string
  # Provide an appropriate default AMI for your region and use case
  default     = "ami-12345678"
}

variable "key_name" {
  description = "The name of the EC2 key pair to associate with instances."
  type        = string
  # Provide the key pair name you want to use
  default     = "your-key-pair"
}

variable "server_names" {
  description = "A list of names for the servers (e.g., ['sonarqube', 'nexus'])."
  type        = list(string)
  default     = []
}
