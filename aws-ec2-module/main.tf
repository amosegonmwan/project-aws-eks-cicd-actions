### Create an IAM Role for GitHub Actions ###
resource "aws_iam_role" "github_actions_role" {
  name = "github-actions"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "ec2.amazonaws.com" }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}
#--------------------------------------------------------------
### Attach managed policies to the IAM Role ###
resource "aws_iam_role_policy_attachment" "github_actions_admin" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = data.aws_iam_policy.admin_full_access.arn
}

# Create an instance profile to attach the role to EC2
resource "aws_iam_instance_profile" "github_actions_instance_profile" {
  name = "github-actions-instance-profile"
  role = aws_iam_role.github_actions_role.name
}
#--------------------------------------------------------------
### Security Group ###
resource "aws_security_group" "web_sg" {
  name        = "tic-tac-toe_sg"
  description = "Allow SSH, HTTP, HTTPS, and port 9000 traffic"

  # Allow SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP (port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS (port 443)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow traffic on port 9000
  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg-name
  }
}

#--------------------------------------------------------------
### EC2 Instance ###
resource "aws_instance" "ec2-server" {
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = var.instance-type
  key_name             = var.key-pair_name
  security_groups      = [aws_security_group.web_sg.name]
  iam_instance_profile = aws_iam_instance_profile.github_actions_instance_profile.name

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }
  
  user_data = file("userdata.sh")
  /*
  user_data = <<-EOF
    #!/bin/bash
    ### Install docker
    sudo apt update -y
    sudo apt install docker.io -y
    sudo systemctl start docker
    sudo systemctl enable docker

    ### Add ubuntu user to docker group
    sudo usermod -aG docker ubuntu
    newgrp docker
    sudo chmod 0660 /var/run/docker.sock
  EOF
  */

  tags = {
    Name = var.ec2-name
  }
}

