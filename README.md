This terraform projects creates EC2 instance with install and configure OpenVPN and Apache web-server

This terreform projects automatically creates EC2 instance on Ubuntu 22.04 distro in Frankfurt region.
This script automatically installs and configures OpenVPN on UDP port 1194, then installs and reconfigures the Apache web server to allow client file uploads without going to the server
## Requirements:
* AWS Free Tier account 
* Terraform
* AWS CLI

## Prerequisite:
* [Install Terraform](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform)
* [Install the latest version of the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [Set the environment variables to configure the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html) - <code> aws configure </code>
* To clone a repository to your local machine, you'll need to have Git installed. If you don't already have it installed, you can download it from the official website - [Git download](https://git-scm.com/downloads) 


Steps:

> `git clone https://github.com/rlnq/terraform-openvpn.git`



* Initialize Terraform:

 > Type `terraform init` , and press Enter. This will download and install any necessary plugins for the providers specified in your configuration file.
 
* Preview your changes:

> Type `terraform plan`, and press Enter. This will show you a preview of the infrastructure that will be created based on your configuration file.

* Apply your changes:

> Type `terraform apply`, and press Enter. This will create the specified infrastructure.

* Manage your infrastructure:

> To make changes to your infrastructure, modify your configuration file and then run `terraform apply` again.

> To destroy your infrastructure, type `terraform destroy`, and press Enter.
