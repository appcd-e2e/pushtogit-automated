module "stackgen_43f5bdda-41d4-5a8a-929e-495c09a1ec8b" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_536d0b-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_71159ccb-d47c-4409-b772-d0de6bcbcd25" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_68d1a5"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupb84b586ec8965f21a5467b7e3d59f9500\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_b84b586e-c896-5f21-a546-7b7e3d59f950.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupb84b586ec8965f21a5467b7e3d59f9501\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_b84b586e-c896-5f21-a546-7b7e3d59f950.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_43f5bdda-41d4-5a8a-929e-495c09a1ec8b.name
  role_type = "Writer"
}

module "stackgen_b84b586e-c896-5f21-a546-7b7e3d59f950" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_536d0b-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_c081c829-8496-5da0-8eb5-8fa856dde3d5" {
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
  function_name         = "stackgen_536d0b-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_b84b586e-c896-5f21-a546-7b7e3d59f950.name
  memory_size           = 128
  role                  = module.stackgen_43f5bdda-41d4-5a8a-929e-495c09a1ec8b.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

