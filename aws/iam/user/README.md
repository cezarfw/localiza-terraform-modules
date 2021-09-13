# IAM User module

Módulo para criação de estrutura de iam user

## Motivação

Hoje em dia, toda aplicação precusa de um IAM User para consumir recursos da AWS, como SQS, SNS e S3. Este módulo viza facilitar a criação desses users e como adicionar policies ao user.

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.60 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| labels | Labels to be used in your module (e.g `team`) | <pre>object({<br>  service = string<br>  team    = string<br>})</pre> | n/a | yes |
| name | IAM User name, e.g. `"app"` or `"jenkins"` | `string` | n/a | yes |
| policies | List of policies ARNs to attach the user to | `list(string)` | `[]` | no |
| groups | List of group names to attach the user to | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the user |

## Exemplo

```hcl
module "my_iam_user" {
  source = "git::git@github.com:cezarfw/localiza-terraform-modules.git//aws/iam/user?ref=vX.Y.Z"

  labels = {
    service = "this-crazy-service"
    team    = "this-crazy-team"
  }

  name = "this-crazy-user"

  policies = [
    "arn:aws:iam::123456789012:policy/this-crazy-policy",
    "arn:aws:iam::123456789012:policy/that-other-crazy-policy"
  ]

  groups = [
    "developers"
  ]
}
```
