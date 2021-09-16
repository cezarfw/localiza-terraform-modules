resource "aws_iam_user" "default" {
  name = var.name
  tags = module.label.tags

  force_destroy = true
}

resource "aws_iam_user_policy_attachment" "default" {
  count = length(var.policies)

  user       = aws_iam_user.default.name
  policy_arn = var.policies[count.index]
}

resource "aws_iam_user_group_membership" "default" {
  count = var.groups == null ? 0 : 1

  user   = aws_iam_user.default.name
  groups = var.groups
}
