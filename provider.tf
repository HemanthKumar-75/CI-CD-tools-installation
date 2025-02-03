terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }

  backend "s3" {
    bucket = "hemanthkumar"
    key    = "ci-cd-tools"
    region = "us-east-1"
    dynamodb_table = "hemanthkumar.online"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}