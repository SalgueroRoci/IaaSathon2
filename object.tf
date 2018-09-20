resource "oci_objectstorage_object" "FEInstance_object" {
	#Required
	bucket = "${var.object_bucket}"
	# content = "${var.object_content}"
	namespace = "${var.namespace}"
	object = "${var.object_object}"

	source = "/home/opc/tftest/FEinstance2Image"
}
