output "law-id"           { value = azurerm_log_analytics_workspace.log.id }
output "appinsights_connection_string" {
  value     = azurerm_application_insights.insight.connection_string
  sensitive = true
}