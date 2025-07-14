# This EC2 Image Builder pipeline is used for local testing to confirm the correct behavior of the components.
# It can be modified to match the end user's own expectations and preferences.
resource "aws_imagebuilder_image_pipeline" "pipeline" {
  image_recipe_arn                 = aws_imagebuilder_image_recipe.recipe.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.infra_config.arn
  name                             = local.imagebuilder_image_pipeline_name
  image_tests_configuration {
    timeout_minutes = 60
  }
}

resource "aws_imagebuilder_image_recipe" "recipe" {
  name         = local.imagebuilder_image_recipe_name
  parent_image = "arn:aws:imagebuilder:${var.region}:aws:image/windows-server-2019-english-full-base-x86/x.x.x"
  version      = "1.0.0"
  block_device_mapping {
    device_name = "/dev/sda1"

    ebs {
      delete_on_termination = true
      volume_size           = "50"
      volume_type           = "gp3"
    }
  }

  component {
    component_arn = aws_imagebuilder_component.newrelic_infra_agent_windows.arn
    parameter {
      name  = "NewRelicLicenseKey"
      value = data.aws_ssm_parameter.new_relic_license.value
    }
  }

  lifecycle { create_before_destroy = true }
}


resource "aws_imagebuilder_infrastructure_configuration" "infra_config" {
  instance_profile_name         = aws_iam_instance_profile.instance_profile.name
  instance_types                = [var.instance_type]
  name                          = "win-ami-pipeline-infra-config"
  security_group_ids            = [aws_security_group.instance_sg.id]
  subnet_id                     = var.subnet_id
  terminate_instance_on_failure = true

  instance_metadata_options {
    http_tokens = "required"
  }
}
