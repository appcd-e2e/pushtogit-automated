module "stackgen_16a506ec-2d7c-5432-a1d1-62b7455c69ba" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_c02433-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_6a74c590-8473-4cbd-bd85-ae3cb79fbf7a" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_824d88"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupba2330541229542ba4f38b11c7a65bd20\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_ba233054-1229-542b-a4f3-8b11c7a65bd2.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupba2330541229542ba4f38b11c7a65bd21\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_ba233054-1229-542b-a4f3-8b11c7a65bd2.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_16a506ec-2d7c-5432-a1d1-62b7455c69ba.name
  role_type = "Writer"
}

module "stackgen_ba233054-1229-542b-a4f3-8b11c7a65bd2" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_c02433-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_bf8b2dd7-9cde-5da9-90f2-ff7157c3a2ba" {
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
  function_name         = "stackgen_c02433-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_ba233054-1229-542b-a4f3-8b11c7a65bd2.name
  memory_size           = 128
  role                  = module.stackgen_16a506ec-2d7c-5432-a1d1-62b7455c69ba.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

