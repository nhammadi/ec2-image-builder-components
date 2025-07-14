resource "aws_imagebuilder_component" "newrelic_infra_agent_windows" {
  name        = local.newrelic_infra_agent_windows_component_name
  platform    = "Windows"
  version     = "1.0.0"
  data        = file("${path.module}/components/newrelic-infra-windows-component/component.yml")
  description = "Installs the New Relic infrastructure agent on Windows"
}
