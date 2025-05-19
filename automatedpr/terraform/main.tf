module "stackgen_3346e9c0-eb4a-50ca-9c62-a286dc0ca888" {
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
  function_name         = "stackgen_a0d4e3-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_b435c843-0cde-542e-bbd8-6485fd1bded8.name
  memory_size           = 128
  role                  = module.stackgen_8e46c345-b822-5a31-9363-a1d5e54df437.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_8e46c345-b822-5a31-9363-a1d5e54df437" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_a0d4e3-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_b435c843-0cde-542e-bbd8-6485fd1bded8" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_a0d4e3-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_feffef17-505e-41c8-8e3c-5f68c235f31a" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_4fda7f"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupb435c8430cde542ebbd86485fd1bded80\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_b435c843-0cde-542e-bbd8-6485fd1bded8.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupb435c8430cde542ebbd86485fd1bded81\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_b435c843-0cde-542e-bbd8-6485fd1bded8.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_8e46c345-b822-5a31-9363-a1d5e54df437.name
  role_type = "Writer"
}

