

module "rg" {
    source = "./modules/rg"
    RG_Name = var.RG_Name
    RG_Location = var.RG_Location
}

module "acr" {
    source = "./modules/acr"
    RG_Name = var.RG_Name
    RG_Location = var.RG_Location
    depends_on = [module.rg]
}

module "aks" {
    source = "./modules/aks"
    RG_Name = var.RG_Name
    RG_Location = var.RG_Location
    container-id = module.acr.container-id
    law-id              = module.appinsight.law-id
    depends_on = [module.acr]
}
module "appinsight" {
  source              = "./modules/appinsight"
  location            = var.RG_Location
  resource_group_name = var.RG_Name
  depends_on = [module.rg]
}

