variable "region" {
  description = "The AWS region to deploy resources"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The type of instance to create"
  default     = "t2.micro"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}