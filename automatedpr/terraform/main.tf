module "stackgen_45ef8202-1823-4b6c-8ace-187fc7ade362" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_f3d3bd"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupd80fc7cb133d575f9e0d85d06a22d0a10\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_d80fc7cb-133d-575f-9e0d-85d06a22d0a1.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupd80fc7cb133d575f9e0d85d06a22d0a11\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_d80fc7cb-133d-575f-9e0d-85d06a22d0a1.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_e06b4a92-66a1-5108-90c4-73dcb5ee060d.name
  role_type = "Writer"
}

module "stackgen_c2a252d3-2f70-577d-837e-d440505a44e1" {
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
  function_name         = "stackgen_d4bae7-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_d80fc7cb-133d-575f-9e0d-85d06a22d0a1.name
  memory_size           = 128
  role                  = module.stackgen_e06b4a92-66a1-5108-90c4-73dcb5ee060d.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_d80fc7cb-133d-575f-9e0d-85d06a22d0a1" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_d4bae7-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_e06b4a92-66a1-5108-90c4-73dcb5ee060d" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_d4bae7-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

