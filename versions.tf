terraform {
  required_version = ">= 1.4.1"
  required_providers {
    equinix = {
      source  = "equinix/equinix"
      version = ">= 1.13.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.3"
    }
  }
}
