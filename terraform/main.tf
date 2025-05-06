module "stackgen_2c99df66-78b9-590e-b976-a377b128d1c8" {
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
  function_name         = "stackgen_ca18cb-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = "$${module.stackgen_90f86c70-9085-5867-a66a-ce1110b1096b.name}"
  memory_size           = 128
  role                  = "$${module.stackgen_8cd5cdde-8d2d-5856-8908-efb33e7a44ed.arn}"
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_7a0ee6dc-2191-4a89-bf3f-4ec0f20f3409" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_d34bcc"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup90f86c7090855867a66ace1110b1096b0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"$${module.stackgen_90f86c70-9085-5867-a66a-ce1110b1096b.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup90f86c7090855867a66ace1110b1096b1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"$${module.stackgen_90f86c70-9085-5867-a66a-ce1110b1096b.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = "$${module.stackgen_8cd5cdde-8d2d-5856-8908-efb33e7a44ed.name}"
  role_type = "Writer"
}

module "stackgen_8cd5cdde-8d2d-5856-8908-efb33e7a44ed" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_ca18cb-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_90f86c70-9085-5867-a66a-ce1110b1096b" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_ca18cb-function"
  retention_in_days = 7
  tags              = {}
}

