module "stackgen_4adf9af2-9b86-59ae-92a1-8f3bc1d9e031" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_6f9842-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_54a18f22-3ed6-5eb5-b069-b84674e2e6b3" {
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
  function_name         = "stackgen_6f9842-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_76792b94-6769-5daf-9154-d549f7040931.name
  memory_size           = 128
  role                  = module.stackgen_4adf9af2-9b86-59ae-92a1-8f3bc1d9e031.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_76792b94-6769-5daf-9154-d549f7040931" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_6f9842-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_fdcb192d-b37b-4107-8612-9733d923bfc1" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_d73c45"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup76792b9467695daf9154d549f70409310\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_76792b94-6769-5daf-9154-d549f7040931.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup76792b9467695daf9154d549f70409311\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_76792b94-6769-5daf-9154-d549f7040931.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_4adf9af2-9b86-59ae-92a1-8f3bc1d9e031.name
  role_type = "Writer"
}

