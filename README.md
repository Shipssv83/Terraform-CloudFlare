Hi, ![](https://user-images.githubusercontent.com/18350557/176309783-0785949b-9127-417c-8b55-ab5a4333674e.gif)my name is Serhii Shypylov
=========================================================================================================================================

-------------------------------

### Socials
<p align="left">
  <a href="https://t.me/oneitpro">
    <img src="https://img.icons8.com/ios-glyphs/30/ffffff/telegram-app.png" alt="Telegram" width="30" height="30" />
  </a>
  <a href="https://www.linkedin.com/in/sergey-shipilov-7262a31b4/">
    <img src="https://img.icons8.com/ios-glyphs/30/ffffff/linkedin.png" alt="LinkedIn" width="30" height="30" />
  </a>
  <a href="https://www.instagram.com/shipssvpl/">
    <img src="https://img.icons8.com/ios-glyphs/30/ffffff/instagram-new.png" alt="Instagram" width="30" height="30" />
  </a>
  <a href="https://www.facebook.com/profile.php?id=100083345006373">
    <img src="https://img.icons8.com/ios-glyphs/30/ffffff/facebook.png" alt="Facebook" width="30" height="30" />
  </a>
  <a href="https://discord.com/invite/6z5EyagDyW?ref=1it.pro">
    <img src="https://img.icons8.com/ios-glyphs/30/ffffff/discord.png" alt="Discord" width="30" height="30" />
  </a>
  <a href="mailto:admin@1it.pro">
    <img src="https://img.icons8.com/ios-glyphs/30/ffffff/new-post.png" alt="Mail" width="30" height="30" />
  </a>
  <a href="https://1it.pro/">
    <img src="https://img.icons8.com/ios-glyphs/30/ffffff/domain.png" alt="Website" width="30" height="30" />
  </a>
</p>

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

```hcl
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

```hcl
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
```hcl
export TF_VAR_cf_account_id="your_account_id"
export TF_VAR_cf_api_token="your_api_token"
export TF_VAR_cloudflare_zone_id="your_zone_id"
```

Initialize Terraform: Run the following command to download the necessary providers:
```hcl
terraform init
```

Plan Changes: To see what changes will be applied:
```hcl
terraform plan
```

Apply Changes: Run the following to apply the changes and create the DNS records:
```hcl
terraform apply
```

Destroy Resources: If you want to remove all resources managed by Terraform:
```hcl
terraform destroy
```

### Conclusion
This Terraform configuration simplifies the management of Cloudflare DNS records. Customize the variables and resources to fit your domain management needs. Terraform ensures consistency and repeatability in your DNS setup.

```
This **README** explains how to set up and use the Terraform configurations to manage DNS records with Cloudflare, detailing the variables and resources involved.
```
