data "aws_ssm_parameter" "new_relic_license" {
  name = "/imagebuilder/newrelic/license-key"
}
