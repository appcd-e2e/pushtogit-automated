module "stackgen_87378e5f-d6d8-5353-8c7f-6631240df92a" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_437b3f-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_afda3f4e-e04d-589a-8c51-094658a295ba" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_437b3f-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_beab9f57-8dc6-4e02-b59b-525343f671d0" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_241945"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup87378e5fd6d853538c7f6631240df92a0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_87378e5f-d6d8-5353-8c7f-6631240df92a.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup87378e5fd6d853538c7f6631240df92a1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_87378e5f-d6d8-5353-8c7f-6631240df92a.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_afda3f4e-e04d-589a-8c51-094658a295ba.name
  role_type = "Writer"
}

module "stackgen_f815bc95-ec0c-5dce-aa69-794c7ebcd3f3" {
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
  function_name         = "stackgen_437b3f-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_87378e5f-d6d8-5353-8c7f-6631240df92a.name
  memory_size           = 128
  role                  = module.stackgen_afda3f4e-e04d-589a-8c51-094658a295ba.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

