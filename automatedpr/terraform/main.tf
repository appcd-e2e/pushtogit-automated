module "stackgen_109aeb91-b81a-5844-bf73-22b25a5f7f13" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_df4eab-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_731393d7-1685-4cea-8fb4-6711f5275234" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_a10144"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupf3f21c7cd75751e1b2b91bceac4be8140\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_f3f21c7c-d757-51e1-b2b9-1bceac4be814.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupf3f21c7cd75751e1b2b91bceac4be8141\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_f3f21c7c-d757-51e1-b2b9-1bceac4be814.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_109aeb91-b81a-5844-bf73-22b25a5f7f13.name
  role_type = "Writer"
}

module "stackgen_f3f21c7c-d757-51e1-b2b9-1bceac4be814" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_df4eab-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_fe8dbf65-b835-52f5-bc2a-5d54bba32109" {
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
  function_name         = "stackgen_df4eab-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_f3f21c7c-d757-51e1-b2b9-1bceac4be814.name
  memory_size           = 128
  role                  = module.stackgen_109aeb91-b81a-5844-bf73-22b25a5f7f13.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

