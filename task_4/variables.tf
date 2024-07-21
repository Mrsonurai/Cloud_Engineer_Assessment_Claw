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

variable "vm_hello_world_name" {
  description = "Name of the hello world VM"
  type        = string
  default     = "hello-world-vm"
}

variable "vm_hello_name" {
  description = "Name of the hello VM"
  type        = string
  default     = "hello-vm"
}

variable "vm_world_name" {
  description = "Name of the world VM"
  type        = string
  default     = "world-vm"
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
