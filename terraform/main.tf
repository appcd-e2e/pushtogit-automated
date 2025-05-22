module "stackgen_4d41d59e-c125-4eb6-9f2b-f04a1fc27f2b" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_cd08f6"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup75627a62b58b5a6a97d254d3e036df230\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_75627a62-b58b-5a6a-97d2-54d3e036df23.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup75627a62b58b5a6a97d254d3e036df231\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_75627a62-b58b-5a6a-97d2-54d3e036df23.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_746c5223-eaf8-51ab-b6b3-898b9d7b7202.name
  role_type = "Writer"
}

module "stackgen_4fb84646-9643-55a8-98d4-c4fa26b03722" {
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
  function_name         = "stackgen_1bcce4-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_75627a62-b58b-5a6a-97d2-54d3e036df23.name
  memory_size           = 128
  role                  = module.stackgen_746c5223-eaf8-51ab-b6b3-898b9d7b7202.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_746c5223-eaf8-51ab-b6b3-898b9d7b7202" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_1bcce4-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_75627a62-b58b-5a6a-97d2-54d3e036df23" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_1bcce4-function"
  retention_in_days = 7
  tags              = {}
}

