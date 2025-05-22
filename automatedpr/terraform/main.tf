module "stackgen_42fda700-f3f8-480b-a979-843c98f65bd7" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_32f6a6"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup437dcfe34f295e53ba5f50a6c6d2f4130\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_437dcfe3-4f29-5e53-ba5f-50a6c6d2f413.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup437dcfe34f295e53ba5f50a6c6d2f4131\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_437dcfe3-4f29-5e53-ba5f-50a6c6d2f413.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_c2aea3c8-a795-5c55-a174-a94395507aa1.name
  role_type = "Writer"
}

module "stackgen_437dcfe3-4f29-5e53-ba5f-50a6c6d2f413" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_9a37f7-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_62166194-a2fe-58e6-88e5-195b4d4f3873" {
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
  function_name         = "stackgen_9a37f7-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_437dcfe3-4f29-5e53-ba5f-50a6c6d2f413.name
  memory_size           = 128
  role                  = module.stackgen_c2aea3c8-a795-5c55-a174-a94395507aa1.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_c2aea3c8-a795-5c55-a174-a94395507aa1" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_9a37f7-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

