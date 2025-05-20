module "stackgen_4df64187-5136-5979-8cc7-df0fd140c8b1" {
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
  function_name         = "stackgen_8461bf-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_ac764936-6fcf-5504-b5b5-66b69db035ce.name
  memory_size           = 128
  role                  = module.stackgen_8ead8e1f-8c15-552b-9dcf-b99718ddaba4.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_8ead8e1f-8c15-552b-9dcf-b99718ddaba4" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_8461bf-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_a76e6f5e-cf36-4361-a6ea-e741930e536f" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_755c0c"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupac7649366fcf5504b5b566b69db035ce0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_ac764936-6fcf-5504-b5b5-66b69db035ce.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupac7649366fcf5504b5b566b69db035ce1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_ac764936-6fcf-5504-b5b5-66b69db035ce.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_8ead8e1f-8c15-552b-9dcf-b99718ddaba4.name
  role_type = "Writer"
}

module "stackgen_ac764936-6fcf-5504-b5b5-66b69db035ce" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_8461bf-function"
  retention_in_days = 7
  tags              = {}
}

