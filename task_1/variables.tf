variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "claw-enterprises-rg"
}

variable "location" {
  description = "Azure region"
  default     = "eastus"
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  default     = "claw-vnet"
}

variable "subnet_name" {
  description = "Name of the Subnet"
  default     = "claw-subnet"
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  default     = "claw-vm"
}

variable "admin_username" {
  description = "Admin username for the VM"
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for the VM"
  default     = "Test@12347699"
}

variable "dns_servers" {
  description = "Custom DNS servers"
  type        = list(string)
  default     = ["8.8.8.8", "8.8.4.4"]
}

variable "allowed_ssh_ip" {
  description = "IP address allowed to SSH into the VM"
}
