module "stackgen_2a29c2b6-d615-5aa6-9018-42816c767b5c" {
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
  function_name         = "stackgen_33ba32-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_b7762560-e398-592b-ad64-5d3495e228e3.name
  memory_size           = 128
  role                  = module.stackgen_fc69bb46-8c7e-537e-84f9-f9f577a69f90.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_b7762560-e398-592b-ad64-5d3495e228e3" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_33ba32-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_d1d0081c-0f49-4c2e-94b8-4aac23825c1a" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_0a7740"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupb7762560e398592bad645d3495e228e30\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_b7762560-e398-592b-ad64-5d3495e228e3.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupb7762560e398592bad645d3495e228e31\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_b7762560-e398-592b-ad64-5d3495e228e3.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_fc69bb46-8c7e-537e-84f9-f9f577a69f90.name
  role_type = "Writer"
}

module "stackgen_fc69bb46-8c7e-537e-84f9-f9f577a69f90" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_33ba32-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

