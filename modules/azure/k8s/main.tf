resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix          = var.cluster_name

  kubernetes_version               = var.k8s_version
  sku_tier                         = "Free"
  private_cluster_enabled          = false

  network_profile {
    network_plugin      = "azure"
  }

  default_node_pool {
    name       = replace(var.cluster_name,"-","")
    vnet_subnet_id                   = var.vnet_subnets[0]
    # enable_auto_scaling = false
    # min_count = 1
    # max_count = 10
    node_count                       = 3
    vm_size                          = "Standard_D2_v4"
    availability_zones               = ["1", "2", "3"]
    type                             = "VirtualMachineScaleSets"
    os_disk_size_gb                  = 50
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    owner = "${var.name_prefix}_tsb"
  }

}

