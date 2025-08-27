# provider.hcl
terraform {
  extra_arguments "azurerm_provider" {
    commands = ["init", "plan", "apply", "destroy"]

    arguments = [
      "-var", "subscription_id=",
      "-var", "tenant_id="
    ]
  }
}
