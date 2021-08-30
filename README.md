# faasd for Equinix Metal

This repo contains a Terraform Module for how to deploy a [faasd](https://github.com/openfaas/faasd) instance on
[Equinix Metal](https://metal.equinix.com/) using [Terraform](https://www.terraform.io/).

__faasd__, a lightweight & portable faas engine, is [OpenFaaS](https://github.com/openfaas/) reimagined, but without the cost and complexity of Kubernetes. It runs on a single host with very modest requirements, making it fast and easy to manage. Under the hood it uses [containerd](https://containerd.io/) and [Container Networking Interface (CNI)](https://github.com/containernetworking/cni) along with the same core OpenFaaS components from the main project.

## What's a Terraform Module?

A Terraform Module refers to a self-contained packages of Terraform configurations that are managed as a group. This repo
is a Terraform Module and contains many "submodules" which can be composed together to create useful infrastructure patterns.

## How do you use this module?

This repository defines a [Terraform module](https://www.terraform.io/docs/modules/usage.html), which you can use in your
code by adding a `module` configuration and setting its `source` parameter to URL of this repository:

```hcl
data "metal_project" "project" {
  name = "My Project"
}

module "faasd" {
  source = "github.com/jsiebens/terraform-equinix-faasd"

  name       = "faasd"
  project_id = data.metal_project.project.id
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| metal | >= 3.0.0 |
| random | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| metal | >= 3.0.0 |
| random | >= 3.1.0 |

## Resources

| Name | Type |
|------|------|
| [metal_device.faasd](https://registry.terraform.io/providers/equinix/metal/latest/docs/resources/device) | resource |
| [random_password.faasd](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| basic\_auth\_password | The basic auth password, if left empty, a random password is generated. | `string` | `null` | no |
| basic\_auth\_user | The basic auth user name. | `string` | `"admin"` | no |
| domain | A public domain for the faasd instance. This will the use of Caddy and a Let's Encrypt certificate | `string` | `""` | no |
| email | Email used to order a certificate from Let's Encrypt | `string` | `""` | no |
| metro | Metro area for the new faasd device. | `string` | `"am"` | no |
| name | The faasd device name. | `string` | n/a | yes |
| plan | The faasd device plan slug. | `string` | `"c3.small.x86"` | no |
| project\_id | The ID of the project in which to create the device. | `string` | n/a | yes |
| project\_ssh\_key\_ids | Array of IDs of the project SSH keys which should be added to the faasd device. | `list(string)` | `[]` | no |
| ufw\_enabled | Flag to indicate if UFW (Uncomplicated Firewall) should be enabled or not. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| basic\_auth\_password | The basic auth password. |
| basic\_auth\_user | The basic auth user name. |
| gateway\_url | The url of the faasd gateway |
| ipv4\_address | The public IP address of the faasd droplet |
<!-- END_TF_DOCS -->

## See Also

- [faasd on Google Cloud Platform](https://github.com/jsiebens/terraform-google-faasd)
- [faasd on Microsoft Azure](https://github.com/jsiebens/terraform-azurerm-faasd)
- [faasd on DigitalOcean](https://github.com/jsiebens/terraform-digitalocean-faasd)
- [faasd on Equinix Metal](https://github.com/jsiebens/terraform-equinix-faasd)