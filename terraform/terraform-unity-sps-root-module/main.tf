# Terraform driver to instantiate the Unity SPS cluster in the cloud.
# Uses the following as a template:
# https://github.jpl.nasa.gov/EURC-SDS/pcs-cws/blob/master/terraform/sds/sds-cws-console/main.tf

# https://learn.hashicorp.com/tutorials/terraform/module-private-registry-share?in=terraform/modules
# https://www.terraform.io/language/modules/syntax


module "unity-sps-hysds-cluster" {
  source    = "../terraform-unity-sps-hysds-cluster"
  namespace = var.namespace
  kubeconfig_filepath = var.kubeconfig_filepath
  base64_encoded_dockerconfig = var.base64_encoded_dockerconfig
}
