resource "aws_eks_cluster" "this" {
  name     = var.name
  role_arn = var.role_arn
  tags     = var.tags
  version  = var.eks_version

  enabled_cluster_log_types = var.enabled_cluster_log_types

  vpc_config {
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    public_access_cidrs     = var.public_access_cidrs
    subnet_ids              = var.subnet_ids
    security_group_ids      = var.security_group_ids
  }

  dynamic "access_config" {
    for_each = var.access_config
    content {
      authentication_mode                         = access_config.value.authentication_mode
      bootstrap_cluster_creator_admin_permissions = access_config.value.bootstrap_cluster_creator_admin_permissions
    }
  }

  dynamic "encryption_config" {
    for_each = var.encryption_provider_key_arn != null ? [true] : []
    content {
      provider {
        key_arn = var.encryption_provider_key_arn
      }
      resources = ["secrets"]
    }
  }

  dynamic "kubernetes_network_config" {
    for_each = var.kubernetes_network_config
    content {
      service_ipv4_cidr = kubernetes_network_config.value.service_ipv4_cidr
      ip_family         = kubernetes_network_config.value.ip_family
    }
  }

  dynamic "outpost_config" {
    for_each = var.outpost_config
    content {
      control_plane_instance_type = outpost_config.value.control_plane_instance_type
      outpost_arns                = [outpost_config.value.outpost_arn]

      dynamic "control_plane_placement" {
        for_each = outpost_config.value.group_name != null ? [true] : []
        content {
          group_name = outpost_config.value.group_name
        }
      }
    }
  }
}
