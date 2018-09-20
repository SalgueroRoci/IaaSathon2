resource "oci_core_virtual_network" "migrationVCN" {
  cidr_block     = "192.168.0.0/16"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "migrationVCN"
  dns_label      = "migrationDNS"
}

resource "oci_core_internet_gateway" "migrationIG" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "migrationIG"
  vcn_id         = "${oci_core_virtual_network.migrationVCN.id}"
}

resource "oci_core_subnet" "migrationSubnet" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.availability_domain - 1],"name")}"
  cidr_block          = "192.168.0.0/24"
  display_name        = "migrationSubnet"
  dns_label           = "migrationDNS"
  security_list_ids   = ["${oci_core_security_list.migrationSecurityList.id}"]
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_virtual_network.migrationVCN.id}"
  route_table_id      = "${oci_core_route_table.migrationRT.id}"
  dhcp_options_id     = "${oci_core_virtual_network.migrationVCN.default_dhcp_options_id}"
}

resource "oci_core_route_table" "migrationRT" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_virtual_network.migrationVCN.id}"
  display_name   = "migrationRT"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "${oci_core_internet_gateway.migrationIG.id}"
  }
}

#Security Lists 
resource "oci_core_security_list" "migrationSecurityList" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_virtual_network.migrationVCN.id}"
  display_name   = "migrationSecurityList"

  // allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }


  // allow inbound ssh traffic from a specific port
  ingress_security_rules {
    protocol  = "6"         // tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {

      // These values correspond to the destination port range.
      "min" = 8080
      "max" = 8080
    }
  }

  ingress_security_rules {
    protocol  = "6"         // tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {

      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
    }
  }

  ingress_security_rules {
    protocol  = "6"         // tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {

      // These values correspond to the destination port range.
      "min" = 3000
      "max" = 3000
    } 
  }

}
