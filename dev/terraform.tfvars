# --- Proxmox connection ---
pve_api_url      = "https://xxxxx:8006"
pve_api_token    = "root@pam!pmox2=xxxxxxxxxxxxxxxxxxxxxxxx"
pve_tls_insecure = true
#pve_ssh_user     = "terraform"
pve_tmp_dir      = "/var/tmp"
pve_node_name    = "pmox2"

# --- Template / storage ---
ct_template_datastore = "local"
ct_template_url       = "http://download.proxmox.com/images/system/debian-12-standard_12.2-1_amd64.tar.zst"
ct_storage_datastore  = "local-lvm"

# --- LXC core ---
ct_vmid        = 241001
ct_hostname    = "ct-example"
ct_cores       = 2
ct_memory_mb   = 1024
ct_swap_mb     = 0
ct_disk_size_gb = "20"
ct_os_type     = "debian"

# --- Networking ---
ct_bridge               = "vmbr0"
#ct_ipv4_cidr            = "xxxxxx/24"
ct_gateway              = "xxxxxx"
ct_dns_domain           = ""
ct_dns_server           = "xxxxxx"
ct_nic_rate_limit_mbps  = 10

# --- Auth inside LXC ---
ct_root_password = "rootpassword"
ct_ssh_pubkey    = "ssh-key"

# --- Features ---
ct_feature_nesting = true
ct_feature_fuse    = false


# --- 5 LXC containers ---
lxcs = {
  web1 = {
    vmid         = 241001
    hostname     = "web1"
    ipv4_cidr    = "xxxxxx/24"
    cores        = 2
    memory_mb    = 1024
    disk_size_gb = "15"
  }

  web2 = {
    vmid         = 241002
    hostname     = "web2"
    ipv4_cidr    = "xxxxxx/24"
    cores        = 2
    memory_mb    = 1024
    disk_size_gb = "15"
  }

  app1 = {
    vmid         = 241003
    hostname     = "app1"
    ipv4_cidr    = "xxxxxx/24"
    cores        = 2
    memory_mb    = 1024
    disk_size_gb = "20"
  }

  app2 = {
    vmid         = 241004
    hostname     = "app2"
    ipv4_cidr    = "xxxxxx/24"
    cores        = 2
    memory_mb    = 1024
    disk_size_gb = "20"
  }

  db1 = {
    vmid         = 241005
    hostname     = "db1"
    ipv4_cidr    = "xxxxxx/24"
    cores        = 4
    memory_mb    = 1024
    disk_size_gb = "40"
  }
}
