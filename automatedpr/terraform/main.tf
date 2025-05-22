module "stackgen_37e70807-19b1-5e79-bc86-084e1fb6b67a" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_59b4fc-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_5030e93e-cc15-4e88-b533-6b1341c958ad" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_a26d0c"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup81714c39688750579a1e45467ad9b2e50\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_81714c39-6887-5057-9a1e-45467ad9b2e5.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup81714c39688750579a1e45467ad9b2e51\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_81714c39-6887-5057-9a1e-45467ad9b2e5.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_37e70807-19b1-5e79-bc86-084e1fb6b67a.name
  role_type = "Writer"
}

module "stackgen_81714c39-6887-5057-9a1e-45467ad9b2e5" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_59b4fc-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_ddeb02a0-011d-510e-a5b3-7e8a39e07fc0" {
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
  function_name         = "stackgen_59b4fc-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_81714c39-6887-5057-9a1e-45467ad9b2e5.name
  memory_size           = 128
  role                  = module.stackgen_37e70807-19b1-5e79-bc86-084e1fb6b67a.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

