# SQS IAM policy module

Módulo para criação de estrutura de uma IAM policy com regras que permitam a utilização de filas SQS.

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.60 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| labels | Labels to be used in your module (e.g `team`) | <pre>object({<br>  service = string<br>  team    = string<br>})</pre> | n/a | yes |
| name | Solution name, e.g. `"app"` or `"jenkins"` | `string` | n/a | yes |
| queues | List of ARNs of the queues | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | The policy ARN |

## Exemplo

```hcl
module "my_iam_sqs_policy" {
  source = "git::git@github.com:cezarfw/localiza-terraform-modules.git//aws/iam/policy/sqs?ref=vX.Y.Z"

  labels = {
    service = "my-crazy-service
    team    = "my-crazy-team
  }

  name = "my-crazy-name"
  queues = [
    "arn:aws:sqs:sa-east-1:1234567890:that-crazy-sqs",
    "arn:aws:sqs:sa-east-1:0987654321:another-crazy-sqs",
    "arn:aws:sqs:us-east-1:0987654321:another-crazy-sqs"
  ]
}
```
