module "rg" {
  source = "../../../Nic_practice_12.07.2026/module/resource_group"
  rg_1   = var.rg_2
}

module "public_ip" {
  source = "../../../Nic_practice_12.07.2026/module/public_ip"
  depends_on = [module.rg]
  pub_1 = var.pub_1
}

module "virtual_network" {
  depends_on = [module.rg]
  source = "../../../Nic_practice_12.07.2026/module/virtual_network"
  vnet_1 = var.vnet_1
}

module "subnet" {
  depends_on = [module.rg, module.virtual_network]
  source = "../../../Nic_practice_12.07.2026/module/subnet"
  snet_1 = var.snet_1
}

module "network_interface" {
  depends_on = [module.public_ip, module.subnet]
  source = "../../../Nic_practice_12.07.2026/module/NIC_card"
  vms = var.vms
}