module "label" {
  source = "../../../label"

  name    = var.name
  service = var.labels.service
  team    = var.labels.team
}

data "aws_iam_policy_document" "policy_document" {
  statement {
    effect    = "Allow"
    resources = ["*"]
    actions   = ["sqs:ListQueues"]
  }

  statement {
    effect    = "Allow"
    resources = var.queues

    actions = [
      "sqs:ChangeMessageVisibility",
      "sqs:ChangeMessageVisibilityBatch",
      "sqs:CreateQueue",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:ReceiveMessage",
      "sqs:SendMessage",
    ]
  }
}

resource "aws_iam_policy" "policy" {
  name   = "${var.name}-sqs-policy"
  policy = data.aws_iam_policy_document.policy_document.json
}
