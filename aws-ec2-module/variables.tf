variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "us-west-2"
}

variable "key-pair_name" {
  description = "Name of the key pair to use"
  default     = "oregon-key"
}

variable "instance-type" {
  description = "EC2 instance type"
  default     = "t2.medium"
}

variable "ec2-name" {
  description = "EC2 instance tag name"
  default     = "tic-tac-toe_ec2"
}

variable "sg-name" {
  description = "Security group tag name"
  default     = "tic-tac-toe_sg"
}
