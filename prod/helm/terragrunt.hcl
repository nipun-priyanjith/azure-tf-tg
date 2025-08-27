terraform {
  source = "../../modules/helm"
}

inputs = {
  env = "prod"
}
