locals {
  api_key = "6fbb0388389c1690fd8f577a34738db8"
  app_key = "d7a2d0a597dc27d3461dfea158a4057cc8a28f9e"
}

module "datadog_integration" {
  source     = "./modules/datadog"
  account_id = data.aws_caller_identity.current.id
  dd_api_key = local.api_key
  account_specific_namespace_rules = {
    "api_gateway"            = "true"
    "application_elb"        = "true"
    "apprunner"              = "true"
    "appstream"              = "false"
    "appsync"                = "false"
    "athena"                 = "true"
    "auto_scaling"           = "true"
    "backup"                 = "true"
    "billing"                = "true"
    "budgeting"              = "true"
    "certificatemanager"     = "true"
    "cloudfront"             = "true"
    "cloudhsm"               = "true"
    "cloudsearch"            = "true"
    "cloudwatch_events"      = "true"
    "cloudwatch_logs"        = "true"
    "codebuild"              = "true"
    "cognito"                = "true"
    "collect_custom_metrics" = "true"
    "connect"                = "false"
    "crawl_alarms"           = "true"
    "directconnect"          = "true"
    "dms"                    = "true"
    "documentdb"             = "true"
    "dynamodb"               = "true"
    "ebs"                    = "false"
    "ec2"                    = "false"
    "ec2api"                 = "false"
    "ec2spot"                = "false"
    "ecs"                    = "true"
    "efs"                    = "true"
    "elasticache"            = "true"
    "elasticbeanstalk"       = "true"
    "elasticinference"       = "true"
    "elastictranscoder"      = "true"
    "elb"                    = "true"
    "emr"                    = "true"
    "es"                     = "true"
    "firehose"               = "true"
    "fsx"                    = "true"
    "gamelift"               = "false"
    "glue"                   = "true"
    "inspector"              = "true"
    "iot"                    = "false"
    "keyspaces"              = "true"
    "kinesis"                = "true"
    "kinesis_analytics"      = "true"
    "kms"                    = "true"
    "lambda"                 = "true"
    "lex"                    = "false"
    "mediaconnect"           = "false"
    "mediaconvert"           = "false"
    "mediapackage"           = "false"
    "mediatailor"            = "false"
    "ml"                     = "true"
    "mq"                     = "false"
    "msk"                    = "true"
    "mwaa"                   = "false"
    "nat_gateway"            = "true"
    "neptune"                = "false"
    "network_elb"            = "true"
    "networkfirewall"        = "true"
    "opsworks"               = "true"
    "polly"                  = "true"
    "rds"                    = "true"
    "rdsproxy"               = "true"
    "redshift"               = "true"
    "rekognition"            = "false"
    "route53"                = "true"
    "route53resolver"        = "true"
    "s3"                     = "true"
    "s3storagelens"          = "true"
    "sagemaker"              = "true"
    "service_quotas"         = "true"
    "ses"                    = "true"
    "shield"                 = "true"
    "sns"                    = "true"
    "sqs"                    = "true"
    "step_functions"         = "true"
    "storage_gateway"        = "true"
    "swf"                    = "true"
    "transitgateway"         = "true"
    "translate"              = "false"
    "trusted_advisor"        = "true"
    "usage"                  = "true"
    "vpn"                    = "true"
    "waf"                    = "true"
    "wafv2"                  = "true"
    "workspaces"             = "true"
    "xray"                   = "true"
  }
  excluded_regions = [
    "af-south-1",
    "ap-northeast-1",
    "ap-northeast-2",
    "ap-northeast-3",
    "ap-south-1",
    "ap-southeast-1",
    "ap-southeast-2",
    "ca-central-1",
    "eu-north-1",
    "eu-west-2",
    "eu-west-3",
    "sa-east-1",
    "us-east-2",
    "us-west-1",
    "us-west-2"
  ]
  datadog_integration_aws_log_collection = [
    "apigw-access-logs",
    "apigw-execution-logs",
    "cloudfront",
    "elb",
    "elbv2",
    "lambda",
    "redshift",
    "s3"
  ]
}
