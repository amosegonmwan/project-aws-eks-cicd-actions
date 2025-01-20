terraform {
  backend "s3" {
    bucket = "s3-remote-backend-2024" # Replace with your actual S3 bucket name
    key    = "aws-eks/terraform.tfstate"
    region = "us-west-2"
  }
}
