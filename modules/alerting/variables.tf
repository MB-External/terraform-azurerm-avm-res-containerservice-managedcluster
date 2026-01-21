variable "aks_cluster_id" {
  type        = string
  description = "The resource ID of the AKS cluster"
  nullable    = false
}

variable "alert_email" {
  type        = string
  description = "Email address for alert notifications"
  nullable    = false
}

variable "parent_id" {
  type        = string
  description = "The parent resource group ID"
  nullable    = false
}

variable "resource_names" {
  type = object({
    action_group         = optional(string)
    alert_cpu            = optional(string)
    alert_memory = optional(string)
  })
  default     = {}
  description = "(Optional) Custom names for alerting resources created by the module, will be computed if not specified."
  nullable    = false
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) Tags of the resource."
}
