data "azurerm_subnet" "snet" {
    for_each = var.vms
    name = each.value.data_subnet_name
    resource_group_name = each.value.resource_group_name
    virtual_network_name = each.value.virtual_network_name
}

data "azurerm_public_ip" "pip" {
    for_each = var.vms
  name                = each.value.data_pip_name
  resource_group_name = each.value.resource_group_name
}