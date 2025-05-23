module "stackgen_0daa8c06-e0d6-57ca-bec7-aea4b269296a" {
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
  function_name         = "stackgen_ecbba5-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_272a3854-ceb0-5fbe-a587-76423ec8cd14.name
  memory_size           = 128
  role                  = module.stackgen_7b4b957a-eabe-550b-a265-36121e4938e0.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_20289bb6-796b-4de2-a197-60dfb696e5e2" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_4973ff"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup272a3854ceb05fbea58776423ec8cd140\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_272a3854-ceb0-5fbe-a587-76423ec8cd14.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup272a3854ceb05fbea58776423ec8cd141\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_272a3854-ceb0-5fbe-a587-76423ec8cd14.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_7b4b957a-eabe-550b-a265-36121e4938e0.name
  role_type = "Writer"
}

module "stackgen_272a3854-ceb0-5fbe-a587-76423ec8cd14" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_ecbba5-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_7b4b957a-eabe-550b-a265-36121e4938e0" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_ecbba5-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

