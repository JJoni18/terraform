# --- Proxmox connection ---
pve_api_url      = "https://10.0.0.17:8006"
pve_api_token    = "root@pam!pmox2=07a07957-8a8e-4bc4-ab30-5b7a58704785"
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
#ct_ipv4_cidr            = "10.0.0.62/24"
ct_gateway              = "10.0.0.1"
ct_dns_domain           = "techlab.local"
ct_dns_server           = "10.0.0.1"
ct_nic_rate_limit_mbps  = 10

# --- Auth inside LXC ---
ct_root_password = "cyberjo"
ct_ssh_pubkey    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDjc0eAMDdMf0wkB2bN0FD5gso7yaLpA3FkntMC4sd2670c5q6HfqMNjryGSaEpr+3CqIdfe5WyrDiM0acZbfieIq95YVUFi1ptkGOGR+fHjA73uOYOf2ZKSxXnf9f3ARu5E8K7F4Hd5ePUlVhEXpEVJ8/xXPLz4/miD1hB7bGJL7eLMwGYO3dJFcFSaSmOQl8ma8QiU4pPn66MiR/ew5yvnanMKyFrZaj7YcMDRiCZqUg8ZePAENhjv0it3n9/Wyciujfg+ab+SNnSu2P74E7hP8ShSCR6lzNIa0YyGgxIJ42iW2OyFSTZkKONjOygki82E0aGmP0wgdm+R8foSCC92SU7eiewxSmYu/M+AKb3G3F9VUg29tQjp/ryr8G3wNc3Hbo17XLkMQGPfJ5VBhgcAWAGIihwROM/lexanXOAw63pjKIxZh7NFRV1xRpD3mEnmhC0RBEgxlng8292LXY+AYZLs7m359xOkwLFQIVyntgUcko9rERdc3KfUf4IL6c= ansible@pyroth.techlab.local"

# --- Features ---
ct_feature_nesting = true
ct_feature_fuse    = false


# --- 5 LXC containers ---
lxcs = {
  web1 = {
    vmid         = 241001
    hostname     = "web1"
    ipv4_cidr    = "10.0.0.91/24"
    cores        = 2
    memory_mb    = 1024
    disk_size_gb = "15"
  }

  web2 = {
    vmid         = 241002
    hostname     = "web2"
    ipv4_cidr    = "10.0.0.92/24"
    cores        = 2
    memory_mb    = 1024
    disk_size_gb = "15"
  }

  app1 = {
    vmid         = 241003
    hostname     = "app1"
    ipv4_cidr    = "10.0.0.93/24"
    cores        = 2
    memory_mb    = 1024
    disk_size_gb = "20"
  }

  app2 = {
    vmid         = 241004
    hostname     = "app2"
    ipv4_cidr    = "10.0.0.94/24"
    cores        = 2
    memory_mb    = 1024
    disk_size_gb = "20"
  }

  db1 = {
    vmid         = 241005
    hostname     = "db1"
    ipv4_cidr    = "10.0.0.95/24"
    cores        = 4
    memory_mb    = 1024
    disk_size_gb = "40"
  }
}
