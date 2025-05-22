module "stackgen_023eefe2-c529-5572-aae1-e5c586d6ac6e" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_846ba9-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_197aa367-e5cf-4e47-aefe-53da3ae0be8e" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_b49aa6"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup023eefe2c5295572aae1e5c586d6ac6e0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_023eefe2-c529-5572-aae1-e5c586d6ac6e.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup023eefe2c5295572aae1e5c586d6ac6e1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_023eefe2-c529-5572-aae1-e5c586d6ac6e.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_7cac3e95-6661-55e6-8c2a-43b1748c5b72.name
  role_type = "Writer"
}

module "stackgen_39f7cea7-c93e-5e22-9f96-e5e0901a588e" {
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
  function_name         = "stackgen_846ba9-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_023eefe2-c529-5572-aae1-e5c586d6ac6e.name
  memory_size           = 128
  role                  = module.stackgen_7cac3e95-6661-55e6-8c2a-43b1748c5b72.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_7cac3e95-6661-55e6-8c2a-43b1748c5b72" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_846ba9-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

