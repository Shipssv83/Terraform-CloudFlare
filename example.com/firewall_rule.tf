resource "cloudflare_ruleset" "firewall_rule" {
  kind    = "zone"
  name    = "default"
  phase   = "http_request_firewall_custom"
  zone_id = var.zone_id
  rules {
    action      = "block"
    description = "Unused filter"
    enabled     = false
    expression  = "not (ip.src == IP...)"
  }
  rules {
    action      = "block"
    description = "Unused filter"
    enabled     = false
    expression  = "ip.src == IP..."
  }
}
