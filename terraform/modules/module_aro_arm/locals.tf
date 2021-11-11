locals {
  aad_oauth_callback_url = format("https://oauth-openshift.apps.%s/oauth2callback/AAD", var.domain_name)
}
