module cert_manager {
  source = "github.com/schrieksoft/module-kustomization.git?ref=main"
  absolute_paths = ["${path.root}/manifests/base"]
  patches = [
    {
      patch = templatefile("${path.module}/patches/namespace.yaml.tftpl",{
        namespace_tolerations = jsonencode(var.namespace_tolerations)
        namespace_node_selector = jsonencode(var.namespace_node_selector)
      })
    },
  ]
}
