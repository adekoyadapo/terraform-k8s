module "azure_base" {
  source      = "./modules/azure/base"
  name_prefix = var.name_prefix
  location    = var.location
  cidr        = var.cidr
}

module "azure_k8s" {
  count               = 1 + var.cp_count
  source              = "./modules/azure/k8s"
  resource_group_name = module.azure_base.resource_group_name
  location            = var.location
  name_prefix         = var.name_prefix
  cluster_name        = "${var.name_prefix}-aks-${count.index + 1}"
  vnet_subnets        = module.azure_base.vnet_subnets
  depends_on          = [module.azure_base]
  k8s_version         = var.k8s_version
}

module "app_bookinfo" {
  source                     = "./modules/app/bookinfo"
  k8s_host                   = module.azure_k8s.0.host
  k8s_cluster_ca_certificate = module.azure_k8s.0.cluster_ca_certificate
  k8s_client_certificate     = module.azure_k8s.0.client_certificate
  k8s_client_key             = module.azure_k8s.0.client_key
}
