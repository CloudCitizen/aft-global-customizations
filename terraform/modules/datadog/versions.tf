terraform {
  required_version = ">= 0.15.0"
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.10"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
