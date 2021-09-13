# var labels
variable "labels" {
  description = "Labels to be used in your module (e.g `team`)"

  type = object({
    service = string
    team    = string
  })
}

variable "name" {
  description = "Solution name, e.g. `\"app\"` or `\"jenkins\"`"
  type        = string
}

# policy variables
variable "queues" {
  description = "List of ARNs of the queues"
  type        = list(string)
}
