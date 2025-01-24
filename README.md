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

```plaintext
.
├── .github                   # GitHub configurations
│   ├── build.yml             # CI/CD workflow for EKS deployment
├── aws-ec2-module            # Terraform module for EC2 provisioning
├── aws-terraform-eks         # Terraform configuration for EKS cluster
├── public                    # Public-facing files for the application
├── src                       # Source code for the application
├── .gitignore                # Git ignore rules
├── Dockerfile                # Docker build configuration
├── deployment-service.yml    # Kubernetes deployment manifest
├── package-lock.json         # npm lock file
├── package.json              # npm configuration file
├── script.sh                 # User data script for EC2 provisioning
├── sonar-project.properties  # SonarQube configuration
└── README.md                 # Project documentation
```


### User Data Script (`script.sh`)
The user data script provisions an EC2 instance with the following:
1. Updates and upgrades the system.
2. Installs Docker, Java 17, Terraform, AWS CLI, Trivy, Node.js, and npm.
3. Configures Docker and Kubernetes tools for the CI/CD pipeline.

### Infrastructure
- **AWS S3**: Stores Terraform remote state for tracking infrastructure changes.
- **AWS EC2**: Hosts a self-hosted GitHub Actions runner.
- **AWS EKS**: Kubernetes cluster for deploying and managing containerized applications.

### Pipeline Highlights
- **GitHub Actions**: Automates testing, building, and deployment of code.
- **SonarQube**: Performs static code analysis to ensure quality and security.
- **Aqua Trivy**: Scans Docker images for vulnerabilities before deployment.
- **Slack Integration**: Sends notifications for pipeline events.

## Getting Started
1. **Clone the repository:**
   ```bash
   - git clone https://github.com/project-aws-eks-cicd-actions.git
   - cd project-aws-eks-cicd-actions
   ```
2. **Set-up AWS EC2 Infrastructure:**
   From your local computer, provision AWS EC2.
   ```bash
   - cd project-aws-eks-cicd-actions/aws-ec2-module
   - terraform init
   - terraform validate
   - terraform plan
   - terraform apply --auto-approve
   ```
   
4. **Set up AWS EKS cluster:**
   SSH into AWS EC2 virtual macine and provision AWS EKS cluster.
   ```bash
   - cd project-aws-eks-cicd-actions/aws-terraform-eks
   - terraform init
   - terraform validate
   - terraform plan
   - terraform apply --auto-approve
   ```
   
