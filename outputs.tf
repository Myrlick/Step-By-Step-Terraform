output "bucket_name" {
  value = aws_s3_bucket.test_bucket.bucket
}

output "instance_id" {
  value = aws_instance.test_ec2.id
}

output "instance_ip" {
  value = aws_instance.test_ec2.public_ip
}