module "stackgen_1a1c6802-0dc9-558d-b790-d604a6c0ba5f" {
  source                = "./modules/aws_lambda"
  architecture          = "x86_64"
  authorization_type    = "NONE"
  cors                  = []
  create_function_url   = false
  description           = null
  environment_variables = {}
  event_source_arn      = null
  event_source_mapping  = []
  filename              = null
  function_name         = "stackgen_92b7f1-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_b3cac179-d51c-56e7-bee0-51e2e5b7ed61.name
  memory_size           = 128
  role                  = module.stackgen_5bb3de8c-8330-531e-97fd-234274b27fde.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_5bb3de8c-8330-531e-97fd-234274b27fde" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_92b7f1-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_b3cac179-d51c-56e7-bee0-51e2e5b7ed61" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_92b7f1-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_d440ef5a-a12d-4037-b605-5f0c70e700c9" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_32c579"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupb3cac179d51c56e7bee051e2e5b7ed610\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_b3cac179-d51c-56e7-bee0-51e2e5b7ed61.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupb3cac179d51c56e7bee051e2e5b7ed611\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_b3cac179-d51c-56e7-bee0-51e2e5b7ed61.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_5bb3de8c-8330-531e-97fd-234274b27fde.name
  role_type = "Writer"
}

