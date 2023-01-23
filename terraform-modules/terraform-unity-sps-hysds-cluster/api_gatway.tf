resource "aws_ssm_parameter" "update_ades_wpst_url_stage_variable_of_api_gateway" {
  name       = format("/%s/%s/%s-%s/api-gateway/stage-variables/ades-wpst-url", var.project, var.venue, var.namespace, var.counter)
  type       = "String"
  value      = "${kubernetes_service.ades-wpst-api-service.status[0].load_balancer[0].ingress[0].hostname}:${var.service_port_map.ades_wpst_api_service}"
  overwrite  = true
  depends_on = [kubernetes_service.ades-wpst-api-service]
}
