terraform {
  required_version = ">= 1.0.0"
  required_providers {
    metal = {
      source  = "equinix/metal"
      version = ">= 3.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0"
    }
  }
}
