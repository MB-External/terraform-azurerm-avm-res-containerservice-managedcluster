module "maintenance_auto_upgrade" {
  source = "./modules/maintenanceconfiguration"

  duration_hours    = try(var.maintenance_window_auto_upgrade.duration, null)
  frequency         = try(var.maintenance_window_auto_upgrade.frequency, null)
  interval          = try(var.maintenance_window_auto_upgrade.interval, null)
  parent_id         = azapi_resource.this.id
  schedule_name     = "aksManagedAutoUpgradeSchedule"
  day_of_month      = try(var.maintenance_window_auto_upgrade.day_of_month, null)
  day_of_week       = try(var.maintenance_window_auto_upgrade.day_of_week, null)
  enable            = var.maintenance_window_auto_upgrade != null
  enable_telemetry  = var.enable_telemetry
  not_allowed_end   = try(var.maintenance_window_auto_upgrade.not_allowed.end, null)
  not_allowed_start = try(var.maintenance_window_auto_upgrade.not_allowed.start, null)
  start_date        = try(var.maintenance_window_auto_upgrade.start_date, null)
  start_time        = try(var.maintenance_window_auto_upgrade.start_time, null)
  user_agent_header = local.avm_azapi_header
  utc_offset        = try(var.maintenance_window_auto_upgrade.utc_offset, null)
  week_index        = try(var.maintenance_window_auto_upgrade.week_index, null)
}

module "maintenance_node_image_upgrade" {
  source = "./modules/maintenanceconfiguration"

  duration_hours    = try(var.maintenance_window.duration, null)
  frequency         = try(var.maintenance_window.frequency, null)
  interval          = try(var.maintenance_window.interval, null)
  parent_id         = azapi_resource.this.id
  schedule_name     = "aksManagedNodeOSUpgradeSchedule"
  day_of_month      = try(var.maintenance_window.day_of_month, null)
  day_of_week       = try(var.maintenance_window.day_of_week, null)
  enable            = var.maintenance_window != null
  enable_telemetry  = var.enable_telemetry
  not_allowed_end   = try(var.maintenance_window.not_allowed.end, null)
  not_allowed_start = try(var.maintenance_window.not_allowed.start, null)
  start_date        = try(var.maintenance_window.start_date, null)
  start_time        = try(var.maintenance_window.start_time, null)
  user_agent_header = local.avm_azapi_header
  utc_offset        = try(var.maintenance_window.utc_offset, null)
  week_index        = try(var.maintenance_window.week_index, null)
}
