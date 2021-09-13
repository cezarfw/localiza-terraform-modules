# SNS IAM policy module

Módulo para criação de estrutura de uma IAM policy com regras que permitam a utilização de tópicos SNS.

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.60 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| labels | Labels to be used in your module (e.g `team`) | <pre>object({<br>  service = string<br>  team    = string<br>})</pre> | n/a | yes |
| name | Solution name, e.g. `"app"` or `"jenkins"` | `string` | n/a | yes |
| topics | List of ARNs of the topics | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | The policy ARN |

## Exemplo

```hcl
module "my_iam_policy_sns" {
  source = "git::git@github.com:cezarfw/localiza-terraform-modules.git//aws/iam/policy/sns?ref=vX.Y.Z"

  labels = {
    service = "my-crazy-service
    team    = "my-crazy-team
  }

  name = "my-crazy-name"
  queues = [
    "arn:aws:sns:sa-east-1:1234567890:that-crazy-sns",
    "arn:aws:sns:sa-east-1:0987654321:another-crazy-sns",
    "arn:aws:sns:us-east-1:0987654321:another-crazy-sns"
  ]
}
```
