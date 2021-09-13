# S3 IAM policy module

Módulo para criação de estrutura de uma IAM policy com regras que permitam a utilização de buckets do S3.

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.60 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| labels | Labels to be used in your module (e.g `team`) | <pre>object({<br>  service = string<br>  team    = string<br>})</pre> | n/a | yes |
| name | Policy name, e.g. `"app"` or `"jenkins"` (this name will be appended by `-s3-policy`, e.g. `"app-s3-policy"`) | `string` | n/a | yes |
| buckets | List with the names of the buckets | `list(string)` | n/a | yes |
| path | The specific path to grant access in the bucket | `string` | `"/*"` | no |
| readonly | If the policy need only to read the objects in the bucket | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The policy ARN |

## Exemplo

```hcl
module "my_iam_policy_s3" {
  source = "git::git@github.com:cezarfw/localiza-terraform-modules.git//aws/iam/policy/s3?ref=vX.Y.Z"

  labels = {
    service = "my-crazy-service"
    team    = "my-crazy-team"
  }

  name     = "my-crazy-name"
  readonly = false
  path     = "/folder/*/subfolder/*"

  buckets = [
    "that-crazy-bucket",
    "other-crazy-bucket",
    "another-crazy-bucket"
  ]
}
```
