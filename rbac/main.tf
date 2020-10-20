resource "aviatrix_rbac_group" "rbac_group" {
  for_each = var.rbac_data

  group_name = each.key
}

resource "aviatrix_rbac_group_access_account_attachment" "group_accounts" {
  for_each = var.rbac_data

  group_name          = each.key
  access_account_name = "all"

  depends_on = [aviatrix_rbac_group.rbac_group]
}

resource "aviatrix_account_user" "user" {
  for_each = var.rbac_data

  username = each.value.username
  email    = each.value.email
  password = each.value.password
}

resource "aviatrix_rbac_group_user_attachment" "user_group_assignment" {
  for_each = var.rbac_data

  group_name = each.key
  user_name  = each.value.username

  depends_on = [aviatrix_account_user.user, aviatrix_rbac_group.rbac_group]
}

