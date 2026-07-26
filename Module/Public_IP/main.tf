resource "azurerm_public_ip" "pip" {
    for_each = var.pub_1
    name = each.value.pub_name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    allocation_method = each.value.allocation_method
}