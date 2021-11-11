data "azuread_service_principal" "aro_rp" {
  display_name = "Azure Red Hat OpenShift RP"
}

resource "azuread_application" "aro" {
  display_name = local.resource_names.service_principal
  web {
    homepage_url  = local.aro_homepage_url
    redirect_uris = [local.aad_oauth_callback_url]
    implicit_grant {
      id_token_issuance_enabled = true
    }
  }
}

resource "azuread_service_principal" "aro" {
  application_id = azuread_application.aro.application_id
}

resource "azuread_application_password" "aro" {
  application_object_id = azuread_application.aro.object_id
}

resource "azurerm_role_assignment" "cluster_aro_vnet" {
  scope                = azurerm_virtual_network.aro.id
  role_definition_name = "Network Contributor"
  principal_id         = azuread_service_principal.aro.object_id
}

resource "azurerm_role_assignment" "rp_aro_vnet" {
  scope                = azurerm_virtual_network.aro.id
  role_definition_name = "Network Contributor"
  principal_id         = data.azuread_service_principal.aro_rp.object_id
}