resource "helm_release" "argo_cd" {
  name       = "argo-cd"
  namespace  = "argo-cd"
  chart      = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  version    = "7.7.7"

  create_namespace = true
  depends_on = [ aws_eks_node_group.general ]

  values = [
    <<-EOF
    server:
      service:
        type: LoadBalancer
    EOF
  ]
}
