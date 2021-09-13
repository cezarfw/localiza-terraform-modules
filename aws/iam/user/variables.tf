# var labels
variable "labels" {
  description = "Labels to be used in your module (e.g `team`)"

  type = object({
    service = string
    team    = string
  })
}

variable "name" {
  description = "IAM User name, e.g. `\"app\"` or `\"jenkins\"`"
  type        = string
}

variable "policies" {
  type        = list(string)
  description = "List of policies ARNs to attach the user to"
  default     = []
}

variable "groups" {
  type        = list(string)
  description = "List of group names to attach the user to"
  default     = null
}
