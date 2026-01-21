variable "alert_email" {
  type        = string
  default     = null
  description = "The email address to send alerts to."
}

variable "alerting_resource_names" {
  type = object({
    action_group         = optional(string)
    alert_cpu            = optional(string)
    alert_memory = optional(string)
  })
  default     = {}
  description = "(Optional) Custom names for alerting resources created by the module, will be computed if not specified."
  nullable    = false
}

variable "monitoring_resource_names" {
  type = object({
    prometheus_data_collection_endpoint         = optional(string)
    prometheus_data_collection_rule             = optional(string)
    prometheus_data_collection_rule_association = optional(string)
    prometheus_rule_group_node                  = optional(string)
    prometheus_rule_group_ux                    = optional(string)
    prometheus_rule_group_k8s                   = optional(string)
    insights_data_collection_rule               = optional(string)
    insights_data_collection_rule_association   = optional(string)
  })
  default     = {}
  description = "(Optional) Custom names for monitoring resources created by the module, will be computed if not specified."
  nullable    = false
}

variable "onboard_alerts" {
  type        = bool
  default     = false
  description = "Whether to enable recommended alerts. Set to false to disable alerts even if monitoring is enabled and alert_email is provided."
  nullable    = false

  validation {
    condition     = !var.onboard_alerts || var.alert_email != null
    error_message = "When `onboard_alerts` is true, `alert_email` must be provided."
  }
}

variable "onboard_monitoring" {
  type        = bool
  default     = false
  description = <<DESCRIPTION
Whether to enable monitoring resources. Set to false to disable monitoring even if workspace IDs are provided.
DESCRIPTION

  validation {
    condition     = !var.onboard_monitoring || try(var.addon_profile_oms_agent.config.log_analytics_workspace_resource_id, null) != null
    error_message = "When `onboard_monitoring` is true, enable oms addon and provide `log_analytics_workspace_resource_id`."
  }
}

variable "prometheus_workspace_id" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The monitor workspace resource ID for managed Prometheus.

Make sure to to also specify `var.azure_monitor_profile`,
Ensure that `kube_state_metrics` are configured.
DESCRIPTION
}
