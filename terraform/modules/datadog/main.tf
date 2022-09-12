resource "datadog_integration_aws" "integration" {
  account_id                       = var.account_id
  role_name                        = "DatadogPolarisIntegrationRole"
  excluded_regions                 = var.excluded_regions
  cspm_resource_collection_enabled = "true"
  host_tags                        = ["aws_account:${var.account_id}"]
  account_specific_namespace_rules = var.account_specific_namespace_rules
}

resource "aws_cloudformation_stack" "datadog_forwarder" {
  name         = "datadog-forwarder"
  capabilities = ["CAPABILITY_IAM", "CAPABILITY_NAMED_IAM", "CAPABILITY_AUTO_EXPAND"]
  parameters = {
    DdApiKey     = var.dd_api_key
    DdSite       = "datadoghq.eu",
    FunctionName = "datadog-forwarder"
  }
  template_url = "https://datadog-cloudformation-template.s3.amazonaws.com/aws/forwarder/latest.yaml"
}

data "aws_lambda_function" "datadog_forwarder" {
  function_name = "datadog-forwarder"
  depends_on = [
    aws_cloudformation_stack.datadog_forwarder
  ]
}

resource "datadog_integration_aws_lambda_arn" "datadog_forwarder" {
  account_id = var.account_id
  lambda_arn = data.aws_lambda_function.datadog_forwarder.arn
}

resource "datadog_integration_aws_log_collection" "log_collection" {
  account_id = var.account_id
  services   = var.datadog_integration_aws_log_collection
  depends_on = [
    datadog_integration_aws_lambda_arn.datadog_forwarder
  ]
}
