resource "oci_core_image" "migrationimage" {
	#Required
	compartment_id = "${var.compartment_ocid}"

	#Optional
	#display_name = "${var.image_display_name}"
	#launch_mode = "${var.image_launch_mode}"

	image_source_details {
		source_type = "objectStorageTuple"
		bucket_name = "${var.bucket_name}"
		namespace_name = "${var.namespace}"
		object_name = "${var.object_object}" # exported image name

		#Optional
		#source_image_type = "${var.source_image_type}"
	}
}
