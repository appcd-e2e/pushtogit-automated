module "stackgen_2ea12fed-92b1-4f62-818f-51c1331c481c" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_017dec"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup7974b3516fb35bf6a342e61250056f050\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_7974b351-6fb3-5bf6-a342-e61250056f05.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup7974b3516fb35bf6a342e61250056f051\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_7974b351-6fb3-5bf6-a342-e61250056f05.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_72fb95cb-05da-5f9a-9f98-d9cc0879a839.name
  role_type = "Writer"
}

module "stackgen_72fb95cb-05da-5f9a-9f98-d9cc0879a839" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_cd83bd-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_7974b351-6fb3-5bf6-a342-e61250056f05" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_cd83bd-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_b4e97765-eb91-547d-b9fc-7539848d5141" {
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
  function_name         = "stackgen_cd83bd-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_7974b351-6fb3-5bf6-a342-e61250056f05.name
  memory_size           = 128
  role                  = module.stackgen_72fb95cb-05da-5f9a-9f98-d9cc0879a839.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

