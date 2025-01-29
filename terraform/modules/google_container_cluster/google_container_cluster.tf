resource "google_container_cluster" "this" {
  name               = var.name
  location           = var.location
  initial_node_count = var.initial_node_count

  remove_default_node_pool = var.remove_default_node_pool

  dynamic "private_cluster_config" {
    for_each = var.enable_private_nodes ? [1] : []
    content {
      enable_private_nodes = var.enable_private_nodes
    }
  }

  dynamic "addons_config" {
    for_each = !var.http_load_balancing ? [1] : []
    content {
      http_load_balancing {
        disabled = true
      }
    }
  }

  dynamic "node_config" {
    for_each = !var.remove_default_node_pool ? [1] : []
    content {
      oauth_scopes = var.oauth_scopes
    }
  }
}