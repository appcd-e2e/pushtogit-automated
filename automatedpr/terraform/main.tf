module "stackgen_35d26cc6-2aa8-52c7-a392-d0a981c7d260" {
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
  function_name         = "stackgen_86ee2d-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_3a12d4fa-844f-5eb3-aaea-44953cad6f1e.name
  memory_size           = 128
  role                  = module.stackgen_ee22f3f0-9136-582e-88f2-6a888fa8f29a.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_3a12d4fa-844f-5eb3-aaea-44953cad6f1e" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_86ee2d-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_81f740a9-5b4d-400c-ad9e-4af2bf26965b" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_071425"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup3a12d4fa844f5eb3aaea44953cad6f1e0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_3a12d4fa-844f-5eb3-aaea-44953cad6f1e.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup3a12d4fa844f5eb3aaea44953cad6f1e1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_3a12d4fa-844f-5eb3-aaea-44953cad6f1e.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_ee22f3f0-9136-582e-88f2-6a888fa8f29a.name
  role_type = "Writer"
}

module "stackgen_ee22f3f0-9136-582e-88f2-6a888fa8f29a" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_86ee2d-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

