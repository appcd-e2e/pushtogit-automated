module "stackgen_7132ff74-ea49-5148-a1ad-c488a83bb6c7" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_c16d0e-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_7f6fc1b8-02a7-5b79-b45a-86943c4e19c3" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_c16d0e-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_8371d357-aea5-5114-acac-ce5d9fbe868e" {
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
  function_name         = "stackgen_c16d0e-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_7f6fc1b8-02a7-5b79-b45a-86943c4e19c3.name
  memory_size           = 128
  role                  = module.stackgen_7132ff74-ea49-5148-a1ad-c488a83bb6c7.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_8ce54f93-feba-4676-b3ae-8cded2d36bcd" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_0d3dbc"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup7f6fc1b802a75b79b45a86943c4e19c30\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_7f6fc1b8-02a7-5b79-b45a-86943c4e19c3.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup7f6fc1b802a75b79b45a86943c4e19c31\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_7f6fc1b8-02a7-5b79-b45a-86943c4e19c3.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_7132ff74-ea49-5148-a1ad-c488a83bb6c7.name
  role_type = "Writer"
}

