module "rg" {
  source = "../../Module/resource_group"
  rg_1   = var.rg_2
}

module "public_ip" {
  source = "../../Module/public_ip"
  depends_on = [module.rg]
  pub_1 = var.pub_1
}

module "virtual_network" {
  depends_on = [module.rg]
  source = "../../Module/virtual_network"
  vnet_1 = var.vnet_1
}

module "subnet" {
  depends_on = [module.rg, module.virtual_network]
  source = "../../Module/subnet"
  snet_1 = var.snet_1
}

module "network_interface" {
  depends_on = [module.public_ip, module.subnet]
  source = "../../Module/NIC_card"
  vms = var.vms
}