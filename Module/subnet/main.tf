resource "azurerm_subnet" "snet" {
    for_each = var.snet_1
    name = each.value.sub_name
    resource_group_name = each.value.resource_group_name
    virtual_network_name = each.value.virtual_network_name
    address_prefixes = each.value.address_prefixes
}