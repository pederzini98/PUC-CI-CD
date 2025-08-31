resource "aws_instance" "app_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI ID
  instance_type = var.instance_type

  tags = {
    Name = "PUC"
  }
}

resource "aws_security_group" "app_sg" {
  name        = "app_security_group"
  description = "Allow HTTP traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = var.bucket_name
  acl    = "private"
}

output "instance_public_ip" {
  value = aws_instance.app_instance.public_ip
}

output "bucket_url" {
  value = aws_s3_bucket.app_bucket.website_endpoint
}