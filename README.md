# CICD Project with GitHub Actions and AWS EKS

## Description
This project implements a robust Continuous Integration and Continuous Deployment (CI/CD) pipeline using GitHub Actions, AWS EKS, and a variety of tools to automate, secure, and streamline application delivery. It leverages Terraform for infrastructure provisioning, Aqua Trivy for security scanning, and integrates with Slack for notifications.

## Prerequisites
- AWS Account with appropriate permissions
- Terraform installed locally or on a provisioned instance
- Node.js and npm installed
- Docker and Docker Hub account
- AWS CLI installed and configured
- Java 17 installed
- Access to a GitHub repository

## Technologies Used
- **Programming Languages and Tools:**
  - HCL (Terraform)
  - JavaScript
  - Shell Scripting
  - CSS, SCSS, HTML
  - Node.js
  - Java 17
  - Docker and Docker Hub
  - npm

- **Cloud and Infrastructure:**
  - AWS S3 (for Terraform remote state)
  - AWS EKS
  - GitHub Actions (self-hosted runner on AWS EC2)
  - Aqua Trivy (security scanning)
  - Slack (notifications)

- **Other Tools:**
  - GitHub for source control
  - SonarQube for code quality analysis

## Architecture
This project is structured as follows:

. ├── .github # GitHub configurations │ ├── eks-workflow.yml # CI/CD workflow for EKS deployment ├── aws-ec2-module # Terraform module for EC2 provisioning ├── aws-terraform-eks # Terraform configuration for EKS cluster ├── public # Public-facing files for the application ├── src # Source code for the application ├── .gitignore # Git ignore rules ├── Dockerfile # Docker build configuration ├── deployment-service.yml # Kubernetes deployment manifest ├── package-lock.json # npm lock file ├── package.json # npm configuration file ├── script.sh # User data script for EC2 provisioning ├── sonar-project.properties # SonarQube configuration └── README.md # Project documentation
