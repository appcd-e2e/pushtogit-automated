module "stackgen_1b95cd38-c6d3-4bcb-901c-696d3315c14c" {
  source                               = "./modules/aws_vpc"
  cidr_block                           = "10.0.0.0/17"
  enable_dns_hostnames                 = false
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags                                 = {}
}

module "stackgen_a233f546-7e43-49a7-858f-163c4253121d" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = null
  map_public_ip_on_launch = false
  tags                    = null
  vpc_id                  = "$${module.stackgen_1b95cd38-c6d3-4bcb-901c-696d3315c14c.id}"
}

module "stackgen_cd794c26-48b4-4f79-b772-423061084a40" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = null
  map_public_ip_on_launch = false
  tags                    = null
  vpc_id                  = "$${module.stackgen_1b95cd38-c6d3-4bcb-901c-696d3315c14c.id}"
}

module "stackgen_e7c9a4ee-4cc2-475b-9bba-b27d040b4a5e" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Effect\": \"Allow\",\n      \"Principal\": {\n        \"Service\": \"eks.amazonaws.com\"\n      },\n      \"Action\": \"sts:AssumeRole\"\n    }\n  ]\n}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "${var.name}"
  path                  = null
  permissions_boundary  = null
  tags                  = {}
}

module "stackgen_f0f61392-835a-42f8-b62c-446282c02bad" {
  source                      = "./modules/aws_eks"
  access_config               = []
  eks_version                 = null
  enabled_cluster_log_types   = ["api", "audit"]
  encryption_provider_key_arn = null
  endpoint_private_access     = true
  endpoint_public_access      = false
  kubernetes_network_config   = []
  name                        = "testekscluster-abhishes"
  outpost_config              = []
  public_access_cidrs         = ["0.0.0.0/0"]
  region                      = "$${var.region}"
  role_arn                    = "$${module.stackgen_e7c9a4ee-4cc2-475b-9bba-b27d040b4a5e.arn}"
  security_group_ids          = []
  subnet_ids                  = ["$${module.stackgen_a233f546-7e43-49a7-858f-163c4253121d.id}", "$${module.stackgen_cd794c26-48b4-4f79-b772-423061084a40.id}"]
  tags = {
    createdBy = "Abhishes"
    purpose   = "testing"
  }
}

