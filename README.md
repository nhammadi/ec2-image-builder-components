# EC2 Image Builder Components

This repository provides reusable, production-ready **EC2 Image Builder components** for automating common agent installations and system configurations on Amazon EC2 instances. Components are defined as YAML documents and provisioned using **Terraform**.

---

## Available Components

### 1. **New Relic Infrastructure Agent (Windows)**

- **Path:** [`components/newrelic-infra-windows-component`](./components/newrelic-infra-windows-component)
- **Description:**
  Installs the latest version of the New Relic Infrastructure agent. This component installs only the agent. You must take additional steps to configure and use the agent. For more information, see the documentation at https://docs.newrelic.com/docs/logs/forward-logs/forward-your-logs-using-infrastructure-agent/.

  > 💡 The license key for the New Relic agent is expected to be stored in AWS Systems Manager Parameter Store under the name `/imagebuilder/newrelic/license-key`, or alternatively in AWS Secrets Manager.

- **Highlights:**
  - Installs latest `.msi` version from New Relic CDN
  - Accepts license key as a parameter
  - Automatically cleans up installer and log files

---

### 2. **Grafana Alloy Agent (Windows)**

- **Path:** [`components/grafana-alloy-windows-component`](./components/grafana-alloy-windows-component)
- **Description:**
  Installs the latest Grafana Alloy agent on Windows by dynamically fetching the latest release from GitHub. This component installs only the agent. You must take additional steps to configure and use the agent. For more information, see the documentation at https://grafana.com/docs/grafana-cloud/monitor-infrastructure/integrations/integration-reference/integration-windows-exporter/

- **Highlights:**
  - Dynamically pulls latest GitHub release
  - Supports silent installation
  - Automatically cleans up installer and log files

---

### 3. **Elastic Agent (Windows)**

- **Path:** [`components/elastic-agent-windows-component`](./components/elastic-agent-windows-component)
- **Description:**
  Installs the Elastic Agent on Windows, enabling integration with Elastic Fleet for centralized observability. The component supports dynamic configuration using input parameters for the MSI download URL, Fleet Server URL, and enrollment token. For more information, see the documentation at [Elastic Fleet: Install Elastic Agent](https://www.elastic.co/docs/reference/fleet/install-fleet-managed-elastic-agent/).

- **Highlights:**
  - MSI URL provided as a configurable input parameter (`Source`)
  - Enrolls agent with Fleet via `INSTALLARGS` at install time
  - Validates service installation and running state
  - Automatically cleans up installer and log files

---

## Usage via Terraform

These components are meant to be used with the [AWS EC2 Image Builder Terraform provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_component).

See sample pipelines and image recipes for details on how to use these components in your builds.

### Example

```hcl
resource "aws_imagebuilder_component" "grafana_alloy" {
  name       = "grafana-alloy-windows"
  platform   = "Windows"
  version    = "1.0.0"
  data       = file("${path.module}/components/grafana-alloy-windows-component/component.yaml")
}
```


## Contributions
Contributions are welcome! Feel free to open issues or pull requests to add new components, fix bugs, or improve documentation.
