module "stackgen_335f0d11-fce4-5b5d-bba9-7e4b4861bb5b" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_669c22-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_8545a276-9bc9-4029-aae8-a8ade05849f3" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_9f82bb"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupc8e7d274886356bab30219d255e38ea70\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_c8e7d274-8863-56ba-b302-19d255e38ea7.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupc8e7d274886356bab30219d255e38ea71\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_c8e7d274-8863-56ba-b302-19d255e38ea7.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_335f0d11-fce4-5b5d-bba9-7e4b4861bb5b.name
  role_type = "Writer"
}

module "stackgen_c7202307-b803-5a11-8002-abf41ae8da53" {
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
  function_name         = "stackgen_669c22-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_c8e7d274-8863-56ba-b302-19d255e38ea7.name
  memory_size           = 128
  role                  = module.stackgen_335f0d11-fce4-5b5d-bba9-7e4b4861bb5b.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_c8e7d274-8863-56ba-b302-19d255e38ea7" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_669c22-function"
  retention_in_days = 7
  tags              = {}
}

