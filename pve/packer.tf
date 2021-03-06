#############################################################
# Packer Templates
#############################################################
locals {
  # Default configuration that applies to all Packer templates
  packer_default_cfg = {
    PKR_VAR_proxmox_hostname  = var.proxmox_api_url
    PKR_VAR_proxmox_username  = var.proxmox_api_username
    PKR_VAR_proxmox_password  = var.proxmox_api_password
    PKR_VAR_proxmox_node      = local.proxmox_nodes.node1.name

    PKR_VAR_vm_cores          = var.packer_default_cores
    PKR_VAR_vm_storage_pool   = var.default_vm_store_id

    PKR_VAR_vm_username       = var.user_name
    PKR_VAR_vm_user_password  = var.user_password
    PKR_VAR_vm_time_zone      = var.default_time_zone
  }

  packer_centos_7 = {
    vm_id     = 4003
    iso_file  = proxmox_virtual_environment_file.centos-7-x86-64-minimal-1908.id
  }

  packer_ubuntu_bionic = {
    vm_id     = 4002
    iso_file  = proxmox_virtual_environment_file.ubuntu-18-04-5-server-amd64.id
  }

}
#############################################################
# Packer Templates - Debian 10 18.04
#############################################################
module "packer-debian-10-6-0-amd64" {
  source                = "github.com/blz-ea/proxmox-packer"

  remove_template       = false
  template              = "debian-10"
  template_description  = "Generated by Packer"

  vm_id           = 4000
  vm_name         = "debian-10-6-0-amd64"
  vm_storage_pool = var.default_vm_store_id
  vm_cores        = var.packer_default_cores
  vm_memory       = 2048
  vm_sockets      = 1

  proxmox_api_url           = var.proxmox_api_url
  proxmox_api_username      = var.proxmox_api_username
  proxmox_api_password      = var.proxmox_api_password
  proxmox_api_otp           = var.proxmox_api_otp
  proxmox_api_tls_insecure  = var.proxmox_api_tls_insecure
  proxmox_node_name         = local.proxmox_nodes.node1.name

  time_zone     = var.default_time_zone
  username      = var.user_name
  user_password = var.user_password

  iso_file = proxmox_virtual_environment_file.debian-10-6-0-amd64-netinst.id
}

#############################################################
# Packer Templates - CentOS 7
#############################################################
module "packer-centos-7-x86-64-minimal-1908" {

  source                = "github.com/blz-ea/proxmox-packer"

  remove_template       = false
  template              = "centos-7"
  template_description  = "Generated by Packer"

  vm_id           = 4001
  vm_name         = "centos-7-x86-64-minimal-1908"
  vm_storage_pool = var.default_vm_store_id
  vm_cores        = var.packer_default_cores
  vm_memory       = 2048
  vm_sockets      = 1

  proxmox_api_url           = var.proxmox_api_url
  proxmox_api_username      = var.proxmox_api_username
  proxmox_api_password      = var.proxmox_api_password
  proxmox_api_otp           = var.proxmox_api_otp
  proxmox_api_tls_insecure  = var.proxmox_api_tls_insecure
  proxmox_node_name         = local.proxmox_nodes.node1.name

  time_zone     = var.default_time_zone
  username      = var.user_name
  user_password = var.user_password

  iso_file = proxmox_virtual_environment_file.centos-7-x86-64-minimal-1908.id
}

#############################################################
# Packer Templates- Ubuntu Bionic 18.04.5
#############################################################
module "packer-ubuntu-server-18-04-5-amd64" {
  source                = "github.com/blz-ea/proxmox-packer"

  remove_template       = false
  template              = "ubuntu-server-18-04"
  template_description  = "Generated by Packer"

  vm_id           = 4002
  vm_name         = "ubuntu-18-04-5-amd64"
  vm_storage_pool = var.default_vm_store_id
  vm_cores        = var.packer_default_cores
  vm_memory       = 2048
  vm_sockets      = 1

  proxmox_api_url           = var.proxmox_api_url
  proxmox_api_username      = var.proxmox_api_username
  proxmox_api_password      = var.proxmox_api_password
  proxmox_api_otp           = var.proxmox_api_otp
  proxmox_api_tls_insecure  = var.proxmox_api_tls_insecure
  proxmox_node_name         = local.proxmox_nodes.node1.name

  time_zone     = var.default_time_zone
  username      = var.user_name
  user_password = var.user_password

  iso_file = proxmox_virtual_environment_file.ubuntu-18-04-5-server-amd64.id
}

