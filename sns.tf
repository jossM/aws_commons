module "monitoring-sns-eu" {
  source = "./sns_mail_topic"

  display_name = "Monitoring Notiifications"
  email_addresses = [var.logs-mail]
  stack_name = "monitoring-sns-eu"
}

output "monitoring-sns-eu-arn" {
  value = module.monitoring-sns-eu.topic-arn
}

module "monitoring-sns-us" {
  source = "./sns_mail_topic"

  providers = {
    aws = aws.us-east-aws
  }

  display_name = "Monitoring Notiifications"
  email_addresses = [var.logs-mail]
  stack_name = "monitoring-sns-us"
}

output "monitoring_sns_us_arn" {
  value = module.monitoring-sns-us.topic-arn
}