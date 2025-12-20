########################
# Proxmox connection
########################
variable "pve_api_url" {
  description = "Proxmox API URL (https://xxxxx:8006)"
  type        = string
}

variable "pve_api_token" {
  description = "Proxmox API token in the form user@realm!tokenid=secret"
  type        = string
  sensitive   = true
}

variable "pve_tls_insecure" {
  description = "Allow insecure TLS (self-signed certs)"
  type        = bool
  default     = true
}

variable "pve_ssh_user" {
  description = "SSH user for provider (for uploads, etc.)"
  type        = string
  default     = "root"
}

variable "pve_tmp_dir" {
  description = "Temporary directory on Proxmox node"
  type        = string
  default     = "/var/tmp"
}

variable "pve_node_name" {
  description = "Target Proxmox node name"
  type        = string
}

########################
# LXC template / storage
########################
variable "ct_template_datastore" {
  description = "Datastore where LXC templates are stored"
  type        = string
}

variable "ct_template_url" {
  description = "URL of the LXC template (e.g. Debian/Ubuntu tar.zst)"
  type        = string
}

variable "ct_storage_datastore" {
  description = "Datastore for LXC root disk"
  type        = string
}

########################
# LXC core settings
########################
variable "ct_vmid" {
  description = "LXC VMID"
  type        = number
  default     = 241001
}

variable "ct_hostname" {
  description = "LXC hostname"
  type        = string
}

variable "ct_cores" {
  description = "CPU cores"
  type        = number
  default     = 1
}

variable "ct_memory_mb" {
  description = "Memory in MB"
  type        = number
  default     = 1048
}

variable "ct_swap_mb" {
  description = "Swap in MB"
  type        = number
  default     = 0
}

variable "ct_disk_size_gb" {
  description = "Disk size in GB (as string, e.g. \"20\")"
  type        = string
  default     = "20"
}

variable "ct_os_type" {
  description = "OS type (debian, ubuntu, etc.)"
  type        = string
}

########################
# Networking
########################
variable "ct_bridge" {
  description = "Bridge interface on Proxmox (e.g. vmbr0)"
  type        = string
}

variable "ct_ipv4_cidr" {
  description = "IPv4 address in CIDR or 'dhcp'"
  type        = string
}

variable "ct_gateway" {
  description = "Default gateway; empty if DHCP"
  type        = string
  default     = ""
}

variable "ct_dns_domain" {
  description = "DNS search domain"
  type        = string
}

variable "ct_dns_server" {
  description = "DNS server IP"
  type        = string
}

variable "ct_nic_rate_limit_mbps" {
  description = "NIC rate limit in Mbps"
  type        = number
  default     = 10
}

########################
# Auth inside LXC
########################
variable "ct_root_password" {
  description = "Root password for the LXC container"
  type        = string
  sensitive   = true
}

variable "ct_ssh_pubkey" {
  description = "SSH public key to inject into root account"
  type        = string
  default     = ""
}

########################
# LXC features
########################
variable "ct_feature_nesting" {
  description = "Enable LXC nesting feature"
  type        = bool
  default     = true
}

variable "ct_feature_fuse" {
  description = "Enable FUSE feature"
  type        = bool
  default     = false
}

variable "lxcs" {
  description = "Map of LXC containers to create"
  type = map(object({
    vmid         = number
    hostname     = string
    ipv4_cidr    = string # "dhcp" or "192.168.x.x/24"
    cores        = number
    memory_mb    = number
    disk_size_gb = string # e.g. "20"
  }))
}

variable "pve_ssh_host" {
  description = "Hostname or IP of the Proxmox node for SSH"
  type        = string
}
