module "stackgen_56d96e91-53c6-5586-bc9d-eca3bb3288bf" {
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
  function_name         = "stackgen_8a7716-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_eea71db8-1dd0-528b-9806-b0a2db33e85a.name
  memory_size           = 128
  role                  = module.stackgen_fd280c4d-f7f4-5fcf-8d04-770208a812fa.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_74212bfb-fd49-4e27-ad4a-e9e4eddf5015" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_dfcc33"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupeea71db81dd0528b9806b0a2db33e85a0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_eea71db8-1dd0-528b-9806-b0a2db33e85a.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupeea71db81dd0528b9806b0a2db33e85a1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_eea71db8-1dd0-528b-9806-b0a2db33e85a.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_fd280c4d-f7f4-5fcf-8d04-770208a812fa.name
  role_type = "Writer"
}

module "stackgen_eea71db8-1dd0-528b-9806-b0a2db33e85a" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_8a7716-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_fd280c4d-f7f4-5fcf-8d04-770208a812fa" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_8a7716-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

