variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "myResourceGroup"
}

variable "location" {
  description = "Location of the resources"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "myVnet"
}

variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
  default     = "mySubnet"
}

variable "vm_name" {
  description = "Name of the VM"
  type        = string
  default     = "myVM"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
}

variable "allowed_ssh_ip" {
  description = "IP address allowed to SSH into the VM"
  type        = string
}
