#Enter Your Tenancy OCID
export TF_VAR_tenancy_ocid="<tenancy_ocid>"
#Enter Your Compartment OCID
export TF_VAR_compartment_ocid="<compartment_ocid>"
#Enter Your User OCID
export TF_VAR_user_ocid="<user_ocid>"
#Enter Your Fingerprint
export TF_VAR_fingerprint="<fingerprint_generated_through_oci_cli>"

#"openssl rsa -in ~/.oci/oci_api_key.pem -pubout -outform DER 2>/dev/null | openssl md5 -c | awk '{print $2}' > ~/.oci/oci_api_key_fingerprint"
export TF_VAR_fingerprint=

export TF_VAR_private_key_path=
export TF_VAR_ssh_public_key= 
export TF_VAR_ssh_private_key= 

export TF_VAR_region=us-ashburn-1

export TF_VAR_bucket_name=FE2bucket
export TF_VAR_bucket_namespace=gse00015150
export TF_VAR_object_bucket=FE2bucket
export TF_VAR_namespace=gse00015150

export TF_VAR_object_object=newObject

export TF_VAR_image_display_name=newImage
export TF_VAR_image_launch_mode=NATIVE

export TF_VAR_instance_shape=VM.Standard1.2
export TF_VAR_instance_display_name=newInstance
