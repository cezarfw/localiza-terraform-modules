module "label" {
  source = "../../../label"

  name    = var.name
  service = var.labels.service
  team    = var.labels.team
}

locals {
  buckets       = [for bucket in var.buckets : "arn:aws:s3:::${bucket}"]
  buckets_paths = [for bucket_arn in local.buckets : "${bucket_arn}${var.path}"]
  resources     = concat(local.buckets, local.buckets_paths)
  read_actions = [
    "s3:ListBucket",
    "s3:GetBucketLocation",
    "s3:GetObject",
    "s3:GetBucketAcl",
  ]
  write_actions = [
    "s3:PutObject",
    "s3:PutObjectAcl",
    "s3:DeleteObject"
  ]
  actions = concat(local.read_actions, var.readonly ? [] : local.write_actions)
}

data "aws_iam_policy_document" "policy_document" {
  statement {
    effect    = "Allow"
    resources = local.resources
    actions   = local.actions
  }
}

resource "aws_iam_policy" "policy" {
  name   = "${var.name}-s3-policy"
  policy = data.aws_iam_policy_document.policy_document.json
}
