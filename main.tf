provider "azurerm" {
     version = "2.9.0"
     features {}    
}

resource "azurerm_resource_group" "tf_challenge" {
  name = "azchallenge-1"
  location = "eastus"
}

resource "azurerm_app_service_plan" "challenge" {
  name = "azchallenge-appserviceplan"
  location = azurerm_resource_group.tf_challenge.location
  resource_group_name = azurerm_resource_group.tf_challenge.name
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "challenge" {
  name = "azchallenge-appservice"
  location = azurerm_resource_group.tf_challenge.location
  resource_group_name = azurerm_resource_group.tf_challenge.name
  app_service_plan_id = azurerm_app_service_plan.challenge.id
  app_settings = {
     "WEBSITE_NODE_DEFAULT_VERSION" = "10.15.2",
    "ApiUrl" = "",
    "ApiUrlShoppingCart" = "",
    "MongoConnectionString" = "",
    "SqlConnectionString" = "",
    "productImagesUrl" = "https://raw.githubusercontent.com/microsoft/TailwindTraders-Backend/master/Deploy/tailwindtraders-images/product-detail",
    "Personalizer__ApiKey" = "",
    "Personalizer__Endpoint" = ""
  }
}
