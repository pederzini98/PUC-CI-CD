output "instance_public_ip" {
  value = aws_instance.my_instance.public_ip
}

output "bucket_url" {
  value = aws_s3_bucket.my_bucket.website_endpoint
}