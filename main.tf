locals {
  tags      = { for tag in var.tags : tag.name => merge(var.default_tag, tag) }
  addresses = { for address in var.addresses : address.name => merge(var.default_address, address) }
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