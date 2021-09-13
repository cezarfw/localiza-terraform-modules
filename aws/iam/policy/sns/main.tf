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
    actions   = ["sns:ListTopics"]
  }

  statement {
    effect    = "Allow"
    resources = var.topics

    actions = [
      "sns:Publish",
      "sns:Subscribe",
      "sns:CreateTopic",
    ]
  }
}

resource "aws_iam_policy" "policy" {
  name   = "${var.name}-sns-policy"
  policy = data.aws_iam_policy_document.policy_document.json
}
