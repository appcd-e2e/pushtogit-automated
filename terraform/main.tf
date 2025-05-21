module "stackgen_3c4cff5a-c3f3-53fe-bea9-921098c4d3f6" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_d9a4b6-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_47965def-c340-5890-a0af-a51729dde986" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_d9a4b6-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_6ada1e66-127d-53de-9282-8a5d5f191ed6" {
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
  function_name         = "stackgen_d9a4b6-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_3c4cff5a-c3f3-53fe-bea9-921098c4d3f6.name
  memory_size           = 128
  role                  = module.stackgen_47965def-c340-5890-a0af-a51729dde986.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_f0e5e81a-6b76-45d3-bd15-03ae56bda4ae" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_f5b86a"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup3c4cff5ac3f353febea9921098c4d3f60\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_3c4cff5a-c3f3-53fe-bea9-921098c4d3f6.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup3c4cff5ac3f353febea9921098c4d3f61\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_3c4cff5a-c3f3-53fe-bea9-921098c4d3f6.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_47965def-c340-5890-a0af-a51729dde986.name
  role_type = "Writer"
}

