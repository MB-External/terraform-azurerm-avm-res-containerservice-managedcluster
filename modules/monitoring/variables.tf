variable "aks_cluster_id" {
  type        = string
  description = "The resource ID of the AKS cluster"
  nullable    = false
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be created"
  nullable    = false
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "The resource ID of the Log Analytics workspace"
  nullable    = false
}

variable "parent_id" {
  type        = string
  description = "The resource ID of the parent resource group"
  nullable    = false
}

variable "prometheus_workspace_id" {
  type        = string
  description = "The resource ID of the Azure Monitor workspace for managed Prometheus"
  nullable    = false
}

variable "resource_names" {
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

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) Tags of the resource."
}
