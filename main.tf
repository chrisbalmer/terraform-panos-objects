locals {
  tags           = { for tag in var.tags : tag.name => merge(var.default_tag, tag) }
  addresses      = { for address in var.addresses : address.name => merge(var.default_address, address) }
  address_groups = { for group in var.address_groups : group.name => merge(var.default_address_group, group) }
  services       = { for service in var.services : service.name => merge(var.default_service, service) }
  service_groups = { for group in var.service_groups : group.name => merge(var.default_service_group, group) }
}

resource "panos_administrative_tag" "tag" {
  for_each = local.tags

  name    = each.value.name
  comment = each.value.comment
  color   = each.value.color
  vsys    = each.value.vsys
}

resource "panos_address_object" "address_object" {
  for_each = local.addresses

  name        = replace(each.value.name, "/[^0-9A-Za-z]/", "-")
  type        = each.value.type
  value       = each.value.value
  description = each.value.description
  tags        = each.value.tags
  vsys        = each.value.vsys

  depends_on = [
    panos_administrative_tag.tag
  ]
}

resource "panos_address_group" "address_group" {
  for_each = local.address_groups

  name          = each.value.name
  description   = each.value.description
  dynamic_match = each.value.dynamic_match
  tags          = each.value.tags
  vsys          = each.value.vsys

  depends_on = [
    panos_administrative_tag.tag
  ]
}

resource "panos_service_object" "service_object" {
  for_each = local.services

  name             = replace(each.value.name, "/[^0-9A-Za-z]/", "-")
  description      = each.value.description
  protocol         = each.value.protocol
  source_port      = each.value.source_port
  destination_port = each.value.destination_port
  tags             = each.value.tags
  vsys             = each.value.vsys

  depends_on = [
    panos_administrative_tag.tag
  ]
}

resource "panos_service_group" "service_group" {
  for_each = local.service_groups

  name     = each.value.name
  services = each.value.services
  tags     = each.value.tags
  vsys     = each.value.vsys

  depends_on = [
    panos_administrative_tag.tag,
    panos_service_object.service_object
  ]
}
