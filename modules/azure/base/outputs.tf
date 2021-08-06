output "vnet_name" {
  value = module.vnet.vnet_name
}

output "vnet_id" {
  value = module.vnet.vnet_id
}

output "vnet_subnets" {
  value = module.vnet.vnet_subnets
}

output "resource_group_name" {
  value = "${var.name_prefix}_resource_group"
}
