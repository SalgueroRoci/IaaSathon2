variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "ssh_public_key" {}
variable "region" {}
variable "availability_domain" {
    default = "1"
}
variable "bucket_name" {}
variable "bucket_namespace" {}
variable "object_bucket" {}
variable "object_object" {}
variable "image_display_name" {}
variable "image_launch_mode" {}
# variable "source_uri" {}
# variable "source_image_type" {}
variable "namespace" {}
variable "instance_shape" {}
variable "instance_display_name" {}
