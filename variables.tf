variable "name" {
  description = "The faasd device name."
  type        = string
}

variable "basic_auth_user" {
  description = "The basic auth user name."
  type        = string
  default     = "admin"
}

variable "basic_auth_password" {
  description = "The basic auth password, if left empty, a random password is generated."
  type        = string
  default     = null
  sensitive   = true
}

variable "domain" {
  description = "A public domain for the faasd instance. This will the use of Caddy and a Let's Encrypt certificate"
  type        = string
  default     = ""
}

variable "email" {
  description = "Email used to order a certificate from Let's Encrypt"
  type        = string
  default     = ""
}

variable "project_id" {
  description = "The ID of the project in which to create the device."
  type        = string
}

variable "metro" {
  description = "Metro area for the new faasd device."
  type        = string
  default     = "am"
}

variable "plan" {
  description = "The faasd device plan slug."
  type        = string
  default     = "c3.small.x86"
}

variable "project_ssh_key_ids" {
  description = "Array of IDs of the project SSH keys which should be added to the faasd device."
  type        = list(string)
  default     = []
}

variable "ufw_enabled" {
  description = "Flag to indicate if UFW (Uncomplicated Firewall) should be enabled or not."
  type        = bool
  default     = true
}