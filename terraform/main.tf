module "stackgen_09f2631b-5b4c-5193-9ff6-e252a1ea0e3c" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_8ad995-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_57993793-5129-5a1a-9a43-1f08276628df" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_8ad995-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_a303181b-76f8-5af9-b6d1-dd1a832c8ee3" {
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
  function_name         = "stackgen_8ad995-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_09f2631b-5b4c-5193-9ff6-e252a1ea0e3c.name
  memory_size           = 128
  role                  = module.stackgen_57993793-5129-5a1a-9a43-1f08276628df.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_bf203ac2-a800-412a-a9f5-9d4b7369f5e0" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_409929"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup09f2631b5b4c51939ff6e252a1ea0e3c0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_09f2631b-5b4c-5193-9ff6-e252a1ea0e3c.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup09f2631b5b4c51939ff6e252a1ea0e3c1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_09f2631b-5b4c-5193-9ff6-e252a1ea0e3c.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_57993793-5129-5a1a-9a43-1f08276628df.name
  role_type = "Writer"
}

