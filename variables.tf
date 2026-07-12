variable "api_management_workspace_named_values" {
  description = <<EOT
Map of api_management_workspace_named_values, attributes below
Required:
    - api_management_workspace_id
    - display_name
    - name
Optional:
    - secret
    - tags
    - value
    - value_key_vault_id (alternative to value - read from Key Vault instead)
    - value_key_vault_secret_name (alternative to value - read from Key Vault instead)
    - value_from_key_vault (block):
        - identity_client_id (optional)
        - secret_id (required)
EOT

  type = map(object({
    api_management_workspace_id = string
    display_name                = string
    name                        = string
    secret                      = optional(bool) # Default: false
    tags                        = optional(list(string))
    value                       = optional(string)
    value_key_vault_id          = optional(string)
    value_key_vault_secret_name = optional(string)
    value_from_key_vault = optional(object({
      identity_client_id = optional(string)
      secret_id          = string
    }))
  }))
}

