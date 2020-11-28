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

variable "address_groups" {}

variable "default_address_group" {
  type = object(
    {
      name          = string
      description   = string
      dynamic_match = list(string)
      tags          = list(string)
      vsys          = string
    }
  )

  default = {
    name          = "default"
    description   = ""
    dynamic_match = null
    tags          = []
    vsys          = null
  }
}
