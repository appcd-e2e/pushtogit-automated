module "stackgen_83cfa7dc-4b6e-4fb6-861e-fa8ebe64a1b9" {
  source                        = "git::https://github.com/sg-tf-demo-org/gcp-mods//./generic-modules/compute/gcp-core-gcs?ref=v0.0.1"
  autoclass                     = false
  bucket_policy_only            = true
  cors                          = []
  custom_placement_config       = null
  enable_hierarchical_namespace = false
  encryption                    = null
  force_destroy                 = false
  iam_members                   = []
  labels = {
    gcs = "testinmobi"
  }
  lifecycle_rules          = []
  location                 = "eastus"
  log_bucket               = null
  log_object_prefix        = null
  name                     = "inmobi-gcs"
  project_id               = "qa-project"
  public_access_prevention = "inherited"
  requester_pays           = false
  retention_policy         = null
  soft_delete_policy       = {}
  storage_class            = null
  versioning               = true
  website                  = {}
}

