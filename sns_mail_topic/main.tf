variable "stack_name" {
  type = string
}
variable "display_name" {
  type = string
}

variable "email_addresses" {
  type = list(string)
}

resource "aws_cloudformation_stack" "sns_topic" {
  name          = var.stack_name
  template_body = templatefile(
    "${path.module}/sns_cloud_formation.tpl",
    {
      display_name  = var.display_name
      subscriptions = join(",", formatlist("{ \"Endpoint\": \"%s\", \"Protocol\": \"EMAIL\"  }", var.email_addresses))
    }
  )
  tags = {"Name": var.stack_name}
}

output "topic-arn" {
  value = aws_cloudformation_stack.sns_topic.outputs["ARN"]
}