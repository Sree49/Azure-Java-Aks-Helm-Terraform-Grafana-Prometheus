resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "kube-cluster"
  location            = var.RG_Location
  resource_group_name = var.RG_Name
  dns_prefix          = "kube-cluster"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DC2ds_v3"
  }
  oms_agent {
    log_analytics_workspace_id =var.law-id
  }
node_provisioning_profile {
    mode = "Auto"
  }
  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_role_assignment" "acr_pull" {
principal_id = azurerm_kubernetes_cluster.cluster.kubelet_identity[0].object_id
role_definition_name = "AcrPull"
scope = var.container-id
skip_service_principal_aad_check = true
}


