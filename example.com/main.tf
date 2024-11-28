resource "cloudflare_record" "test" {
  name    = "test"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "IP-ADDRES"
  zone_id = var.zone_id
}

resource "cloudflare_record" "test2" {
  name    = "test2"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "IP-ADDRES"
  zone_id = "7c17200c379af70ba4e9fd4ce7210654"
}

resource "cloudflare_record" "terraform_managed_resource_254bd0cbae7bd6d8d584538dd1be70f3" {
  name    = "_5ec6ab7322fda2daa5006d97aa9d3f87"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "----"
  zone_id = var.zone_id
}

resource "cloudflare_record" "mx_oneit_uk2" {
  name     = "example.com"
  priority = 20
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "mx2..eu"
  zone_id  = var.zone_id
}

resource "cloudflare_record" "mx_oneit_uk3" {
  name     = "example.com"
  priority = 10
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "mx..eu"
  zone_id  = var.zone_id
}

resource "cloudflare_record" "txt_oneit_uk" {
  name    = "example.com"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=spf1 include:.eu ~all"
  zone_id = var.zone_id
}
