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

variable "tags" {
  default = []
}

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

variable "address_groups" {
  default = []
}

variable "default_address_group" {
  type = object(
    {
      name          = string
      description   = string
      dynamic_match = string
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

variable "services" {
  default = []
}

variable "default_service" {
  type = object(
    {
      name             = string
      description      = string
      protocol         = string
      source_port      = string
      destination_port = string
      tags             = list(string)
      vsys             = string
    }
  )

  default = {
    name             = null
    description      = null
    protocol         = null
    source_port      = null
    destination_port = null
    tags             = []
    vsys             = null
  }
}

variable "service_groups" {
  default = []
}

variable "default_service_group" {
  type = object(
    {
      name     = string
      services = list(string)
      tags     = list(string)
      vsys     = string
    }
  )

  default = {
    name     = null
    services = null
    tags     = null
    vsys     = null
  }
}
