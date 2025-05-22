module "stackgen_061c4aab-bcbf-57dc-b16e-dcc58316345f" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_e84df4-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_2191b6b6-3e7d-5508-815a-bdc52cafe160" {
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
  function_name         = "stackgen_e84df4-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_cb911806-d385-5077-8faa-94bd41544e2c.name
  memory_size           = 128
  role                  = module.stackgen_061c4aab-bcbf-57dc-b16e-dcc58316345f.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_8d7934c3-b7c7-48f0-a10c-114becf94628" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_ffe1d6"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupcb911806d38550778faa94bd41544e2c0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_cb911806-d385-5077-8faa-94bd41544e2c.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupcb911806d38550778faa94bd41544e2c1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_cb911806-d385-5077-8faa-94bd41544e2c.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_061c4aab-bcbf-57dc-b16e-dcc58316345f.name
  role_type = "Writer"
}

module "stackgen_cb911806-d385-5077-8faa-94bd41544e2c" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_e84df4-function"
  retention_in_days = 7
  tags              = {}
}

