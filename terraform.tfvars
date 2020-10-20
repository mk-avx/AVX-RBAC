rbac_data = {
  security_admin = {
    username          = "john" # Username can't contain capital letters, will be fixed soon
    email             = "john.doe@aviatrix.com"
    password          = "Aviatrix123#"
    group_permissions = ["all_firewall_network_write", "all_security_write"]
  }
  network_admin = {
    username          = "jane" # Username can't contain capital letters, will be fixed soon
    email             = "jane.doe@aviatrix.com"
    password          = "Aviatrix123#"
    group_permissions = ["all_transit_network_write", "all_peering_write"]
  }
}
