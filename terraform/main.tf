module "stackgen_58efeb93-56d2-4839-8ab8-097be9ae4d9b" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_2f4154"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupa6de5c8f55af5f10902515c8c98feb290\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_a6de5c8f-55af-5f10-9025-15c8c98feb29.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupa6de5c8f55af5f10902515c8c98feb291\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_a6de5c8f-55af-5f10-9025-15c8c98feb29.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_ff3de9ea-1ffd-5ef3-9f20-e70d5f0520a8.name
  role_type = "Writer"
}

module "stackgen_767c7c11-cf32-5a5d-8dba-b581617624c8" {
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
  function_name         = "stackgen_f6f8eb-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_a6de5c8f-55af-5f10-9025-15c8c98feb29.name
  memory_size           = 128
  role                  = module.stackgen_ff3de9ea-1ffd-5ef3-9f20-e70d5f0520a8.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_a6de5c8f-55af-5f10-9025-15c8c98feb29" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_f6f8eb-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_ff3de9ea-1ffd-5ef3-9f20-e70d5f0520a8" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_f6f8eb-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

