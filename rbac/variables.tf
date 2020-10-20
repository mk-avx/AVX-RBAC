variable "rbac_data" {
  type = map(object({
    username          = string
    email             = string
    password          = string
    group_permissions = list(string)
  }))
}
