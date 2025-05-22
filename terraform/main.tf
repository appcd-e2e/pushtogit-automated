module "stackgen_33bc1509-bb3a-5e19-874d-8a2596c9ae3a" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_b77054-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_400979ec-d421-57b9-9609-8cd65b81d6b8" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_b77054-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_a80558d8-625f-4af3-89b9-0c7c03427c6d" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_e136eb"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup400979ecd42157b996098cd65b81d6b80\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_400979ec-d421-57b9-9609-8cd65b81d6b8.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup400979ecd42157b996098cd65b81d6b81\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_400979ec-d421-57b9-9609-8cd65b81d6b8.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_33bc1509-bb3a-5e19-874d-8a2596c9ae3a.name
  role_type = "Writer"
}

module "stackgen_c55c00d5-ca3f-5b0d-a2b0-1f6c8d84e910" {
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
  function_name         = "stackgen_b77054-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_400979ec-d421-57b9-9609-8cd65b81d6b8.name
  memory_size           = 128
  role                  = module.stackgen_33bc1509-bb3a-5e19-874d-8a2596c9ae3a.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

