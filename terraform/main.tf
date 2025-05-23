module "stackgen_2af7837e-566a-57b8-8b07-cf2fba26ba96" {
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
  function_name         = "stackgen_432313-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_a9b5417e-8784-54ae-9163-4b9572e484d4.name
  memory_size           = 128
  role                  = module.stackgen_2e6ed6df-573e-5cd7-91bd-ff0fba8f8255.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_2e6ed6df-573e-5cd7-91bd-ff0fba8f8255" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_432313-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_5497cdf2-03b4-49f3-8643-fd62a9846d49" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_abb7fd"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupa9b5417e878454ae91634b9572e484d40\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_a9b5417e-8784-54ae-9163-4b9572e484d4.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupa9b5417e878454ae91634b9572e484d41\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_a9b5417e-8784-54ae-9163-4b9572e484d4.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_2e6ed6df-573e-5cd7-91bd-ff0fba8f8255.name
  role_type = "Writer"
}

module "stackgen_a9b5417e-8784-54ae-9163-4b9572e484d4" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_432313-function"
  retention_in_days = 7
  tags              = {}
}

