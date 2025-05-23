module "stackgen_01b9c3ca-d07f-57bb-8d2e-596ae335b29c" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_bedc98-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_13365b80-d089-58a8-970a-be731358d597" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_bedc98-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_742f01c6-623d-51c6-ba39-c59372a87e5c" {
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
  function_name         = "stackgen_bedc98-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_13365b80-d089-58a8-970a-be731358d597.name
  memory_size           = 128
  role                  = module.stackgen_01b9c3ca-d07f-57bb-8d2e-596ae335b29c.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_96682754-337c-4dc0-9885-6c24e6c89bf6" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_9dccbe"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup13365b80d08958a8970abe731358d5970\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_13365b80-d089-58a8-970a-be731358d597.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup13365b80d08958a8970abe731358d5971\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_13365b80-d089-58a8-970a-be731358d597.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_01b9c3ca-d07f-57bb-8d2e-596ae335b29c.name
  role_type = "Writer"
}

