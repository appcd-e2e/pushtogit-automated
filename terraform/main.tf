module "stackgen_37812477-37eb-5872-af65-0d0727215f50" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_92ee8a-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_d694d26d-3e55-5f28-a66f-4970199b75a0" {
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
  function_name         = "stackgen_92ee8a-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_ec959a94-9e1c-5a68-9c91-31366cd50806.name
  memory_size           = 128
  role                  = module.stackgen_37812477-37eb-5872-af65-0d0727215f50.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_e3a16a01-73d1-42d6-a56a-2c040934bb83" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_12a3cc"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupec959a949e1c5a689c9131366cd508060\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_ec959a94-9e1c-5a68-9c91-31366cd50806.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupec959a949e1c5a689c9131366cd508061\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_ec959a94-9e1c-5a68-9c91-31366cd50806.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_37812477-37eb-5872-af65-0d0727215f50.name
  role_type = "Writer"
}

module "stackgen_ec959a94-9e1c-5a68-9c91-31366cd50806" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_92ee8a-function"
  retention_in_days = 7
  tags              = {}
}

