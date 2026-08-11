Resource_Group = {
  RG-1 = {
    name       = "Resource-Group-1"
    location   = "australiaeast"
    managed_by = "Terraform"
  }
  RG-2 = {
    name       = "Resource-Group-2"
    location   = "australiaeast"
    managed_by = "Azure"
  }
  RG-3 = {
    name       = "Resource-Group-3"
    location   = "australiaeast"
    managed_by = "Microsoft Azure"
  }
}

Virtual_Network = {
  Vnet-1 = {
    name                = "Frontend-Virtual-Network"
    location            = "australiaeast"
    resource_group_name = "Resource-Group-1"
    address_space       = ["10.121.0.0/24"]
  }
  Vnet-2 = {
    name                = "Backend-Virtual-Network"
    location            = "australiaeast"
    resource_group_name = "Resource-Group-2"
    address_space       = ["10.124.0.0/24"]
  }
  Vnet-3 = {
    name                = "Database-Virtual-Network"
    location            = "australiaeast"
    resource_group_name = "Resource-Group-3"
    address_space       = ["10.143.0.0/24"]
  }
}

Subnet = {
  Snet-1 = {
    name                 = "Frontend-Subnet"
    resource_group_name  = "Resource-Group-1"
    virtual_network_name = "Frontend-Virtual-Network"
    address_prefixes     = ["10.121.0.0/26"]
  }
  Snet-2 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "Resource-Group-1"
    virtual_network_name = "Frontend-Virtual-Network"
    address_prefixes     = ["10.121.0.64/26"]
  }
  Snet-3 = {
    name                 = "Backend-Subnet"
    resource_group_name  = "Resource-Group-2"
    virtual_network_name = "Backend-Virtual-Network"
    address_prefixes     = ["10.124.0.0/26"]
  }
  Snet-4 = {
    name                 = "Database-Subnet"
    resource_group_name  = "Resource-Group-3"
    virtual_network_name = "Database-Virtual-Network"
    address_prefixes     = ["10.143.0.0/26"]
  }
}

Public_IP = {
  PIP-1 = {
    name                = "Frontend-VM-Public-IP"
    location            = "australiaeast"
    resource_group_name = "Resource-Group-1"
    allocation_method   = "Static"
  }
  PIP-2 = {
    name                = "Bastion-Host-Public-IP"
    location            = "australiaeast"
    resource_group_name = "Resource-Group-1"
    allocation_method   = "Static"
  }
}

Network_Interface_Card = {
  NIC-1 = {
    name                          = "NIC-1"
    location                      = "australiaeast"
    resource_group_name           = "Resource-Group-1"
    ip_configuration_name         = "IP-Config-1"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "Frontend-Subnet"
    virtual_network_name          = "Frontend-Virtual-Network"
  }
  NIC-2 = {
    name                          = "NIC-2"
    location                      = "australiaeast"
    resource_group_name           = "Resource-Group-2"
    ip_configuration_name         = "IP-Config-2"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "Backend-Subnet"
    virtual_network_name          = "Backend-Virtual-Network"
  }
  NIC-3 = {
    name                          = "NIC-3"
    location                      = "australiaeast"
    resource_group_name           = "Resource-Group-3"
    ip_configuration_name         = "IP-Config-3"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "Database-Subnet"
    virtual_network_name          = "Database-Virtual-Network"
  }
}

Storage_Account = {
  Storage-Account-1 = {
    name                     = "frontendstorage879866"
    location                 = "australiaeast"
    resource_group_name      = "Resource-Group-1"
    account_replication_type = "LRS"
    account_tier             = "Standard"
  }
  Storage-Account-2 = {
    name                     = "backendstorage879866"
    location                 = "australiaeast"
    resource_group_name      = "Resource-Group-2"
    account_replication_type = "LRS"
    account_tier             = "Standard"
  }
  Storage-Account-3 = {
    name                     = "databasestorage879866"
    location                 = "australiaeast"
    resource_group_name      = "Resource-Group-3"
    account_replication_type = "LRS"
    account_tier             = "Standard"
  }
}

Storage_Container = {
  Storage-Container-1 = {
    name                  = "frontend-container"
    storage_account_name  = "frontendstorage879866"
    container_access_type = "private"
    resource_group_name   = "Resource-Group-1"
  }
  Storage-Container-2 = {
    name                  = "backend-container"
    storage_account_name  = "backendstorage879866"
    container_access_type = "blob"
    resource_group_name   = "Resource-Group-2"
  }
  Storage-Container-3 = {
    name                  = "database-container"
    storage_account_name  = "databasestorage879866"
    container_access_type = "container"
    resource_group_name   = "Resource-Group-3"
  }
}

Virtual_Network_Peering = {
  Frontend-Backend_Vnet_Peering = {
    name                        = "FrontendVnettoBackendVnet"
    resource_group_name         = "Resource-Group-1"
    virtual_network_name        = "Frontend-Virtual-Network"
    remote_virtual_network_name = "Backend-Virtual-Network"
    remote_resource_group_name  = "Resource-Group-2"
  }
  Backend-Frontend_Vnet_Peering = {
    name                        = "BackendVnettoFrontendVnet"
    resource_group_name         = "Resource-Group-2"
    virtual_network_name        = "Backend-Virtual-Network"
    remote_virtual_network_name = "Frontend-Virtual-Network"
    remote_resource_group_name  = "Resource-Group-1"
  }

  Frontend-Database_Vnet_Peering = {
    name                        = "FrontendVnettoDatabaseVnet"
    resource_group_name         = "Resource-Group-1"
    virtual_network_name        = "Frontend-Virtual-Network"
    remote_virtual_network_name = "Database-Virtual-Network"
    remote_resource_group_name  = "Resource-Group-3"
  }
  Database-Frontend_Vnet_Peering = {
    name                        = "DatabaseVnettoFrontendVnet"
    resource_group_name         = "Resource-Group-3"
    virtual_network_name        = "Database-Virtual-Network"
    remote_virtual_network_name = "Frontend-Virtual-Network"
    remote_resource_group_name  = "Resource-Group-1"
  }

  Backend-Database_Vnet_Peering = {
    name                        = "BackendVnettoDatabaseVnet"
    resource_group_name         = "Resource-Group-2"
    virtual_network_name        = "Backend-Virtual-Network"
    remote_virtual_network_name = "Database-Virtual-Network"
    remote_resource_group_name  = "Resource-Group-3"
  }
  Database-Backend_Vnet_Peering = {
    name                        = "DatabaseVnettoBackendVnet"
    resource_group_name         = "Resource-Group-3"
    virtual_network_name        = "Database-Virtual-Network"
    remote_virtual_network_name = "Backend-Virtual-Network"
    remote_resource_group_name  = "Resource-Group-2"
  }
}

Bastion_Host = {
  Bastion_Host-1 = {
    name                  = "Azure-Bastion-Host"
    location              = "australiaeast"
    resource_group_name   = "Resource-Group-1"
    ip_configuration_name = "Bastion-Config"
    subnet_name           = "AzureBastionSubnet"
    virtual_network_name  = "Frontend-Virtual-Network"
    public_ip_name        = "Bastion-Host-Public-IP"
  }
}

Network_Security_Group = {
  NSG-1 = {
    name                       = "NSG-1"
    location                   = "australiaeast"
    resource_group_name        = "Resource-Group-1"
    security_rule_name         = "Security_rule_for_RG-1"
    priority                   = "100"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  NSG-2 = {
    name                       = "NSG-1"
    location                   = "australiaeast"
    resource_group_name        = "Resource-Group-2"
    security_rule_name         = "Security_rule_for_RG-2"
    priority                   = "101"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  NSG-3 = {
    name                       = "NSG-3"
    location                   = "australiaeast"
    resource_group_name        = "Resource-Group-3"
    security_rule_name         = "Security_rule_for_RG-3"
    priority                   = "102"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

Linux_Virtual_Machine = {
  VM-2 = {
    name                            = "VM-2"
    location                        = "australiaeast"
    resource_group_name             = "Resource-Group-2"
    size                            = "Standard_B2ats_v2"
    admin_username                  = "VM-2"
    admin_password                  = "Welcome@6789"
    disable_password_authentication = "false"
    network_interface_card_name     = "NIC-2"
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts-gen2"
    version                         = "latest"
  }

  # VM-3 = {
  #   name                            = "VM-3"
  #   location                        = "australiaeast"
  #   resource_group_name             = "Resource-Group-3"
  #   size                            = "Standard_B2ts_v2"
  #   admin_username                  = "VM-3"
  #   admin_password                  = "Welcome@1234"
  #   disable_password_authentication = "false"
  #   network_interface_card_name     = "NIC-3"
  #   caching                         = "ReadWrite"
  #   storage_account_type            = "Standard_LRS"
  #   publisher                       = "Canonical"
  #   offer                           = "ubuntu-24_04-lts"
  #   sku                             = "server"
  #   version                         = "latest"
  # }
}

Windows_Virtual_Machine = {
  VM-1 = {
    name                        = "VM-1"
    location                    = "australiaeast"
    resource_group_name         = "Resource-Group-1"
    size                        = "Standard_B2als_v2"
    admin_username              = "VM-1"
    admin_password              = "Welcome@4567"
    network_interface_card_name = "NIC-1"
    caching                     = "ReadWrite"
    storage_account_type        = "Standard_LRS"
    publisher                   = "MicrosoftWindowsServer"
    offer                       = "WindowsServer"
    sku                         = "2016-Datacenter"
    version                     = "latest"
  }
}