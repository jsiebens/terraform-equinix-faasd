locals {
  generate_password   = var.basic_auth_password == null || var.basic_auth_password == ""
  basic_auth_user     = var.basic_auth_user
  basic_auth_password = local.generate_password ? random_password.faasd[0].result : var.basic_auth_password

  user_data_vars = {
    basic_auth_user     = local.basic_auth_user
    basic_auth_password = local.basic_auth_password
    domain              = var.domain
    email               = var.email
    ufw_enabled         = var.ufw_enabled
  }
}

resource "random_password" "faasd" {
  count   = local.generate_password ? 1 : 0
  length  = 16
  special = false
}

resource "equinix_metal_device" "faasd" {
  hostname            = var.name
  plan                = var.plan
  metro               = var.metro
  operating_system    = "ubuntu_20_04"
  billing_cycle       = "hourly"
  project_id          = var.project_id
  project_ssh_key_ids = var.project_ssh_key_ids

  user_data = templatefile("${path.module}/templates/startup.sh", local.user_data_vars)
}