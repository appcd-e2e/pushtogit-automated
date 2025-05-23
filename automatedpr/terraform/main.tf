module "stackgen_4fd43ac7-d266-4fe2-b882-a366bcdfe22a" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_cb2800"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup4fee853b238f5e25801efa7604db439c0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_4fee853b-238f-5e25-801e-fa7604db439c.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup4fee853b238f5e25801efa7604db439c1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_4fee853b-238f-5e25-801e-fa7604db439c.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_bb4ccf18-6453-5906-a957-206f6d877d6a.name
  role_type = "Writer"
}

module "stackgen_4fee853b-238f-5e25-801e-fa7604db439c" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_93e7c6-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_9fc5f587-3722-5ef8-bb17-cd7b346c6e5f" {
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
  function_name         = "stackgen_93e7c6-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_4fee853b-238f-5e25-801e-fa7604db439c.name
  memory_size           = 128
  role                  = module.stackgen_bb4ccf18-6453-5906-a957-206f6d877d6a.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_bb4ccf18-6453-5906-a957-206f6d877d6a" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_93e7c6-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

