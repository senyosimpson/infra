terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "do_ssh_key" {
  name       = "PAT"
  public_key = file(var.public_key)
}

resource "digitalocean_droplet" "droplet" {
  image    = "ubuntu-20-04-x64"
  size     = "s-1vcpu-1gb"
  name     = var.name
  region   = "lon1"
  ssh_keys = [digitalocean_ssh_key.do_ssh_key.fingerprint]
}

