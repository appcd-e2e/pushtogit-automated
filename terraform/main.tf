module "stackgen_150453eb-2465-55a5-8ddb-6abf995826af" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_d37308-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_9c867ef3-79ce-53c0-9a13-08495368f9a1" {
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
  function_name         = "stackgen_d37308-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_150453eb-2465-55a5-8ddb-6abf995826af.name
  memory_size           = 128
  role                  = module.stackgen_b053cfa3-3db3-5f01-b272-8451e9981272.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_b053cfa3-3db3-5f01-b272-8451e9981272" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_d37308-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_e537cc2c-508b-447c-9ae6-af6584eec2b1" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_bc8a3e"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup150453eb246555a58ddb6abf995826af0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_150453eb-2465-55a5-8ddb-6abf995826af.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup150453eb246555a58ddb6abf995826af1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_150453eb-2465-55a5-8ddb-6abf995826af.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_b053cfa3-3db3-5f01-b272-8451e9981272.name
  role_type = "Writer"
}

