# Step by Step Terraform

My learning repo for Terraform on AWS. Each step is a small project that builds on the previous one.

## Step 1: S3 + EC2 basics

What this step creates:

- **EC2 instance** with the AMI looked up through a `data` source (Amazon Linux 2023), so no hardcoded AMI ID
- **Security group** that allows SSH only from my own IP
- **S3 bucket** with a unique name: the `random` provider adds a random suffix
  - versioning enabled
  - public access fully blocked
  - server-side encryption enabled

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) installed
- [AWS CLI](https://aws.amazon.com/cli/) configured with credentials (check with `aws sts get-caller-identity`)

## Usage

1. Clone the repo:

   ```bash
   git clone https://github.com/Myrlick/Step-By-Step-Terraform.git
   cd Step-By-Step-Terraform
   ```

2. Create a `terraform.tfvars` file with your public IP in CIDR notation:

   ```hcl
   ip = "1.2.3.4/32"
   ```

3. Deploy:

   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

4. When you are done, clean up so nothing keeps costing money:

   ```bash
   terraform destroy
   ```

## Variables

| Name            | Description                                   | Default     |
| --------------- | --------------------------------------------- | ----------- |
| `ip`            | Your public IP in CIDR notation, e.g. `1.2.3.4/32` | none (required) |
| `region`        | AWS region                                    | `eu-west-1` |
| `instance_type` | EC2 instance type                             | `t3.micro`  |

## Outputs

- `bucket_name`: name of the S3 bucket
- `instance_id`: ID of the EC2 instance
- `instance_ip`: public IP of the EC2 instance
