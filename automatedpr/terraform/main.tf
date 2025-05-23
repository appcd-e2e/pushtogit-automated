module "stackgen_0144bbe3-0798-5f48-958c-0e8a5ce73636" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_ddb8f0-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_9484d2c6-8d50-50f5-bf8f-87984c0da7f7" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_ddb8f0-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_d65c3665-bd8d-4738-91ad-0122cd8931e8" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_c9c1aa"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup9484d2c68d5050f5bf8f87984c0da7f70\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_9484d2c6-8d50-50f5-bf8f-87984c0da7f7.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup9484d2c68d5050f5bf8f87984c0da7f71\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_9484d2c6-8d50-50f5-bf8f-87984c0da7f7.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_0144bbe3-0798-5f48-958c-0e8a5ce73636.name
  role_type = "Writer"
}

module "stackgen_f1116316-2e05-5314-9d08-6448f5bf616e" {
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
  function_name         = "stackgen_ddb8f0-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_9484d2c6-8d50-50f5-bf8f-87984c0da7f7.name
  memory_size           = 128
  role                  = module.stackgen_0144bbe3-0798-5f48-958c-0e8a5ce73636.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

