resource "oci_core_instance" "migration_instance" {
	#Required
	availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.availability_domain - 1],"name")}"
	compartment_id = "${var.compartment_ocid}"
	shape = "${var.instance_shape}"

	
	create_vnic_details {
		#Required
		subnet_id = "${oci_core_subnet.migrationSubnet.id}"

		#Optional
		# assign_public_ip = "${var.instance_create_vnic_details_assign_public_ip}"
		# defined_tags = {"Operations.CostCenter"= "42"}
		# display_name = "${var.instance_create_vnic_details_display_name}"
		# freeform_tags = {"Department"= "Finance"}
		# hostname_label = "${var.instance_create_vnic_details_hostname_label}"
		# private_ip = "${var.instance_create_vnic_details_private_ip}"
		# skip_source_dest_check = "${var.instance_create_vnic_details_skip_source_dest_check}"
	}
	# defined_tags = {"Operations.CostCenter"= "42"}
	display_name = "${var.instance_display_name}"
	# extended_metadata {
	# 	some_string = "stringA"
	# 	nested_object = "{\"some_string\": \"stringB\", \"object\": {\"some_string\": \"stringC\"}}"
	# }
	# fault_domain = "${var.instance_fault_domain}"
	# freeform_tags = {"Department"= "Finance"}
	# hostname_label = "${var.instance_hostname_label}"
	# ipxe_script = "${var.instance_ipxe_script}"
	# metadata {
	#	ssh_authorized_keys = "${var.ssh_public_key}"
	#	user_data = "${base64encode(file(var.custom_bootstrap_file_name))}"
	#	}
	source_details {
	    #Required
	    source_id = "${oci_core_image.migrationimage.id}"
	    source_type = "image"

	    #Optional
	    # boot_volume_size_in_gbs = "60"
	}
	preserve_boot_volume = false
}
