variable "addresses" {}

variable "default_address" {
  type = object(
    {
      name        = string
      type        = string
      value       = string
      description = string
      tags        = string
      vsys        = string
    }
  )

  default = {
    name        = null
    type        = null
    value       = null
    description = null
    tags        = null
    vsys        = null
  }
}

variable "tags" {}

variable "default_tag" {
  type = object(
    {
      name    = string
      comment = string
      color   = string
      vsys    = string
    }
  )

  default = {
    name    = "default"
    comment = ""
    color   = ""
    vsys    = null
  }
}