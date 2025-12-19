terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.69"   # or current version you want
    }
  }
}

provider "proxmox" {
  endpoint  = var.pve_api_url          # e.g. https://pve01.example.com:8006
  api_token = var.pve_api_token        # tokenID=tokenSecret
  insecure  = var.pve_tls_insecure     # true in homelab with self-signed certs

  # Optional: SSH for uploading templates etc.
  ssh {
    agent    = true
    username = var.pve_ssh_user        # usually same as token user (e.g. terraform)
  }

  tmp_dir = var.pve_tmp_dir            # e.g. /var/tmp
}