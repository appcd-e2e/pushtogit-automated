module "stackgen_25fc67bc-1ba0-503d-9ac4-4fbab84e9bc9" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_59ef0a-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_7c8f377b-ea6c-55ed-83ec-8a7a904ceb91" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_59ef0a-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_7dfefe76-a5de-5ef8-a1ca-6ecd5eb8ec11" {
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
  function_name         = "stackgen_59ef0a-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_7c8f377b-ea6c-55ed-83ec-8a7a904ceb91.name
  memory_size           = 128
  role                  = module.stackgen_25fc67bc-1ba0-503d-9ac4-4fbab84e9bc9.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_d4079e95-a3bb-46d5-9c83-d03286f0cd0c" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_7bf9b7"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup7c8f377bea6c55ed83ec8a7a904ceb910\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_7c8f377b-ea6c-55ed-83ec-8a7a904ceb91.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup7c8f377bea6c55ed83ec8a7a904ceb911\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_7c8f377b-ea6c-55ed-83ec-8a7a904ceb91.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_25fc67bc-1ba0-503d-9ac4-4fbab84e9bc9.name
  role_type = "Writer"
}

