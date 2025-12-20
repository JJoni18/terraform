
############################################
# Optional: Download LXC template from URL
############################################
resource "proxmox_virtual_environment_file" "debian_template" {
  content_type = "vztmpl"
  datastore_id = var.ct_template_datastore # e.g. "local"
  node_name    = var.pve_node_name         # e.g. "pve01"

  source_file {
    path = var.ct_template_url # HTTP/HTTPS URL of .tar.zst
  }
}

############################################
# LXC Container
############################################
resource "proxmox_virtual_environment_container" "lxc" {
  for_each = var.lxcs

  description   = "Managed by Terraform"
  node_name     = var.pve_node_name
  start_on_boot = true
  started       = true
  unprivileged  = true

  vm_id = each.value.vmid
  tags  = ["terraform", "lxc"]

  cpu {
    architecture = "amd64"
    cores        = each.value.cores
  }

  disk {
    datastore_id = var.ct_storage_datastore
    size         = each.value.disk_size_gb
  }

  memory {
    dedicated = each.value.memory_mb
    swap      = var.ct_swap_mb
  }

  operating_system {
    template_file_id = proxmox_virtual_environment_file.debian_template.id
    type             = var.ct_os_type # e.g. "debian"
  }

  initialization {
    hostname = each.value.hostname

    dns {
      domain = var.ct_dns_domain
      #  server = var.ct_dns_server
    }

    ip_config {
      ipv4 {
        address = each.value.ipv4_cidr # per-container
        gateway = var.ct_gateway       # shared gateway
      }
    }

    user_account {
      password = var.ct_root_password
      keys     = length(var.ct_ssh_pubkey) > 0 ? [var.ct_ssh_pubkey] : []
    }
  }

  network_interface {
    name       = var.ct_bridge # e.g. "vmbr0"
    rate_limit = var.ct_nic_rate_limit_mbps
  }

  features {
    nesting = var.ct_feature_nesting
    fuse    = var.ct_feature_fuse
  }
}
