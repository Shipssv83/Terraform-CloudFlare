module "example.com" {
  source = "./example.com"
  zone_id    = var.example_com_zone_id
  account_id = var.cf_account_id
  email      = var.email
  api_token  = var.api_token
}
