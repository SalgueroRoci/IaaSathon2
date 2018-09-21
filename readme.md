# Transfer from "DataCenter" On Premises to OCI 

## Used our Front end polling app 

We created a custom image and created a custom storage object (bucket) that holds that image 
then downloaded the image to our local machine to simulate the image being stored in the "datacenter". 

reference: [How to Import/Export Images on Oracle Cloud Infrastructure](https://community.oracle.com/blogs/gmelo/2017/09/24/how-to-importexport-images-on-oracle-bare-metal-cloud-services)</br>

### Create an instance and install terraform:
$ curl -L -o terraforminstall.sh http://bit.ly/2pw9mpT </br>
$ bash ./terraforminstall.sh

### Setup oci cli
$ oci setup config </br>
Add API key to the OCI Console </br>

### To start Terrafrom : 
$ source env-vars </br>
$ terraform init </br>
$ terraform plan </br>
$ terrafrom apply </br>

reference: [terraform provider oci](https://github.com/terraform-providers/terraform-provider-oci)

