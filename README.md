Hi, ![](https://user-images.githubusercontent.com/18350557/176309783-0785949b-9127-417c-8b55-ab5a4333674e.gif)my name is Serhii Shypylov
=========================================================================================================================================

💛 I am a Linux System administrator engineer with DevOps practices. I have several certificates in Linux, Docker, Ansible and Terraform and continue to learn more. I like everything related to Docker, containers and IT technologies in general. I love solving complex IT solutions.
-------------------------------

* 💼 Looking for a job
* 🌍 I'm based in Poznan
* 🖥️ See my [LinkedIn](https://github.com/Shipssv83) profile 
* 👾 Chat with IT pros on [Discord](https://discord.com/shipssv_19055)\
* 📧 Reach me at ships@ukr.net
* 🧠 I'm learning DevOps Practices

### Socials

<p align="left"> <a href="https://github.com/Shipssv83" target="_blank" rel="noreferrer"> <picture> <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/socials/github-dark.svg" /> <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/socials/github.svg" /> <img src="https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/socials/github.svg" width="32" height="32" /> </picture> </a> <a href="https://www.linkedin.com/in/sergey-shipilov-7262a31b4/" target="_blank" rel="noreferrer"> <picture> <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/socials/linkedin-dark.svg" /> <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/socials/linkedin.svg" /> <img src="https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/socials/linkedin.svg" width="32" height="32" /> </picture> </a></p>

# Terraform Setup for Cloudflare DNS Management

This project provides Terraform configurations to manage Cloudflare DNS records for a domain. It allows the creation of various DNS records, including `A`, `CNAME`, `MX`, and `TXT` records, using the Cloudflare API.

## Overview

The Terraform configuration manages DNS records on Cloudflare, including:
- **A Records**: Points a domain or subdomain to an IP address.
- **CNAME Records**: Aliases one domain name to another.
- **MX Records**: Configures mail servers for the domain.
- **TXT Records**: Holds text data, such as SPF records for email.

## Prerequisites

Before you begin, you need:
- A Cloudflare account.
- An API token with appropriate permissions to manage DNS records.
- Cloudflare account ID and zone ID for your domain.

## Variables

The Terraform configuration uses the following variables:

- `cf_account_id`: Your Cloudflare account ID.
- `cf_api_token`: Your Cloudflare API token.
- `cloudflare_zone_id`: The ID of the Cloudflare zone (domain) you wish to manage.
- `domain`: The domain you are managing DNS records for.

## Terraform Configuration

### Providers

Terraform requires the Cloudflare provider:

```hcl
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cf_api_token
}
```
### Variables

```
variable "cf_account_id" {
  description = "Cloudflare account ID"
  type        = string
  default     = null
}

variable "cf_api_token" {
  description = "Cloudflare API token"
  type        = string
  default     = null
}

variable "cloudflare_zone_id" {
  description = "Cloudflare zone ID for the domain"
  type        = string
  default     = "---"
}

variable "domain" {
  description = "Domain name"
  type        = string
  default     = "example.com"
}

```

### Example Resources

A Record: Points the domain test.example.com to an IP address.

```
resource "cloudflare_record" "test" {
  name    = "test"
  type    = "A"
  value   = "IP-ADDRESS"
  ttl     = 1
  proxied = false
  zone_id = var.cloudflare_zone_id
}
```

### How to Use

Example:
```
export TF_VAR_cf_account_id="your_account_id"
export TF_VAR_cf_api_token="your_api_token"
export TF_VAR_cloudflare_zone_id="your_zone_id"
```

Initialize Terraform: Run the following command to download the necessary providers:
```
terraform init
```

Plan Changes: To see what changes will be applied:
```
terraform plan
```

Apply Changes: Run the following to apply the changes and create the DNS records:
```
terraform apply
```

Destroy Resources: If you want to remove all resources managed by Terraform:
```
terraform destroy
```

### Conclusion
This Terraform configuration simplifies the management of Cloudflare DNS records. Customize the variables and resources to fit your domain management needs. Terraform ensures consistency and repeatability in your DNS setup.

```
This **README** explains how to set up and use the Terraform configurations to manage DNS records with Cloudflare, detailing the variables and resources involved.
```