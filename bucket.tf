resource "oci_objectstorage_bucket" "Terraform_Bucket" {
	#Required
	compartment_id = "${var.compartment_ocid}"
	name = "${var.bucket_name}"
	namespace = "${var.bucket_namespace}"

	#Optional
	# access_type = "${var.bucket_access_type}"
	# defined_tags = {"Operations.CostCenter"= "42"}
	# freeform_tags = {"Department"= "Finance"}
	# metadata = "${var.bucket_metadata}"
	# storage_tier = "${var.bucket_storage_tier}"
}
