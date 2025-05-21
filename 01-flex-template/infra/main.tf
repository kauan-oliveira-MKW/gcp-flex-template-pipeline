# Provider Docker autenticado no GCP
provider "docker" {
  alias = "gcr_provider"
  registry_auth {
    address  = "${var.region}-docker.pkg.dev"
    username = "oauth2accesstoken"
    password = var.gcp_auth_token  # Token gerado via GitHub Actions ou gcloud
  }
}

# Build da imagem Docker
resource "docker_image" "dataflow_template" {
  provider = docker.gcr_provider
  name     = "${var.region}-docker.pkg.dev/${var.project_id}/dataflow-templates/minha-template:v1"
  
  build {
  context    = "${path.module}/.."  # Isso aponta para o diretório 01-flex-template
  dockerfile = "docker/Dockerfile"  # Relativo ao contexto
}
}

# Push para o Artifact Registry
resource "docker_registry_image" "push_image" {
  provider = docker.gcr_provider
  name     = docker_image.dataflow_template.name
}
