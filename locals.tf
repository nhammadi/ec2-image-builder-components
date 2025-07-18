locals {
  imagebuilder_image_pipeline_name            = "windows-2019-ami-pipeline"
  imagebuilder_image_recipe_name              = "windows-2019-ami-recipe"
  imagebuilder_role_name                      = "ec2-image-builder-role"
  instance_profile_role_name                  = "ec2-image-builder-instance-profile"
  newrelic_infra_agent_windows_component_name = "newrelic-infra-agent-windows"
  grafana_alloy_agent_windows_component_name  = "grafana-alloy-agent-windows"
  elastic_agent_windows_component_name        = "elastic-agent-windows"
  security_group_name                         = "image-builder-sg"
}
