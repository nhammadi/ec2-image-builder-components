output "newrelic_infra_agent_windows_component_arn" {
  description = "ARN of the newrelic-infra-windows-component"
  value       = aws_imagebuilder_component.newrelic_infra_agent_windows.arn
}

output "grafana_alloy_agent_windows_component_arn" {
  description = "ARN of the grafana-alloy-windows-component"
  value       = aws_imagebuilder_component.grafana_alloy_agent_windows.arn
}

output "elastic_agent_windows_component_arn" {
  description = "ARN of the elastic-agent-windows-component"
  value       = aws_imagebuilder_component.elastic_agent_windows.arn
}
