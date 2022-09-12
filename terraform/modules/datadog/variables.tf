variable "account_id" {
  type        = string
  description = "AWS account ID for this integration"
}

variable "dd_api_key" {
  type        = string
  description = "Datadog API Key"
}

variable "account_specific_namespace_rules" {
  type        = map(string)
  description = "Map of AWS Services for which Datadog integration will be enabled"
  default     = {}
}

variable "datadog_integration_aws_log_collection" {
  type        = set(string)
  description = "Set of AWS Services for which Datadog can automatically collect logs."
}

variable "excluded_regions" {
  type        = set(string)
  description = "Set of excluded AWS regions for the Datadog integration"
}
