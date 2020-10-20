module "aviatrix-create-rbac-users-groups" {
  source = "./rbac"

  rbac_data = var.rbac_data
}

resource "aviatrix_rbac_group_permission_attachment" "security_admin_permission" {
  for_each = toset(var.rbac_data.security_admin.group_permissions)

  group_name      = "security_admin"
  permission_name = each.value

  depends_on = [module.aviatrix-create-rbac-users-groups]
}

resource "aviatrix_rbac_group_permission_attachment" "network_admin_permission" {
  for_each = toset(var.rbac_data.network_admin.group_permissions)

  group_name      = "network_admin"
  permission_name = each.value

  depends_on = [module.aviatrix-create-rbac-users-groups]
}
