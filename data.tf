data "aws_ssm_parameter" "new_relic_license" {
  name = "/imagebuilder/newrelic/license-key"
}

data "aws_ssm_parameter" "elastic_enrollment_token" {
  name = "/imagebuilder/elastic/enrollment-token"
}

data "aws_ssm_parameter" "elastic_fleet_server_url" {
  name = "/imagebuilder/elastic/fleet-server-url"
}
