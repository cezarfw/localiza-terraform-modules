# var labels
variable "labels" {
  description = "Labels to be used in your module (e.g `team`)"

  type = object({
    service = string
    team    = string
  })
}

variable "name" {
  description = "Policy name, e.g. `\"app\"` or `\"jenkins\"` (this name will be appended by `-s3-policy`, e.g. `\"app-s3-policy\"`)"
  type        = string
}

# policy variables
variable "buckets" {
  description = "List with the names of the buckets"
  type        = list(string)
}

variable "path" {
  description = "The specific path to grant access in the bucket"
  type        = string
  default     = "/*"
}

variable "readonly" {
  description = "If the policy need only to read the objects in the bucket"
  type        = bool
  default     = true
}
