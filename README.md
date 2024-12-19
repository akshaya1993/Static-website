**Static Website Deployment with Terraform**

**Overview**

This project demonstrates how to deploy a static website to AWS using Terraform. The website is hosted on an S3 bucket configured for static website hosting, with public-read access enabled for the necessary files.

**Prerequisites**

Before starting, ensure you have the following:

Terraform installed on your local machine (Installation Guide).

AWS CLI configured with proper credentials (Setup Guide).

An active AWS account.

HTML files for your website (e.g., index.html and error.html).

**Features**

**This deployment includes**:

S3 Bucket Creation: A new bucket is created to host the static website.

Ownership Controls: Ensures bucket ownership is preferred by the bucket owner.

Public Access Settings: Configures the bucket to allow public access.

Static Website Hosting: Sets up index.html as the default document and error.html for errors.

Public Access for Files: Grants public-read access to index.html and error.html.

**Project Structure**

static-website-terraform/
├── main.tf                # Main Terraform configuration file
├── variables.tf           # Variables for bucket configuration
├── outputs.tf             # Outputs for bucket information
├── index.html             # Main HTML file
├── error.html             # Error page HTML file
└── README.md              # Project documentation


**Steps to Deploy**

Clone the Repository

git clone <repository-url>
cd static-website-terraform

Initialize Terraform
Run the following command to initialize the Terraform project and download necessary providers:

terraform init

Customize Variables
Update the variables.tf file or provide a terraform.tfvars file to set custom values for your bucket name.

Validate the Configuration
Ensure your configuration is valid:

terraform validate

Plan the Infrastructure
Generate a plan to see the resources that will be created:

terraform plan

Apply the Configuration
Deploy the infrastructure:

terraform apply

Confirm the changes when prompted.

Access the Website

Note the bucket website endpoint from the Terraform output.

Open the URL in your browser to view the static website.

Outputs

After applying the configuration, the following outputs will be displayed:

Bucket Website URL: The URL to access the static website.

Bucket Name: The name of the S3 bucket created.

**Cleaning Up**

To destroy the infrastructure and avoid incurring unnecessary costs:

terraform destroy

Troubleshooting

**Access Denied Errors:**

Ensure the ACL and public access settings are correctly applied.

Website Not Loading:

Verify the index.html and error.html files are uploaded to the bucket.

Check the bucket's website endpoint.

Future Enhancements

Automate deployment with CI/CD pipelines.

Add versioning to the S3 bucket for better file management.

Configure HTTPS using CloudFront and ACM.

**References**

Terraform AWS Provider Documentation

AWS S3 Static Website Hosting Guide


