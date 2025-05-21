module "stackgen_04d74d69-065d-4ea7-a2e7-17195486b3cb" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_300b43"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup907c434ff60f564ebba1ea48e22957e70\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_907c434f-f60f-564e-bba1-ea48e22957e7.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup907c434ff60f564ebba1ea48e22957e71\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_907c434f-f60f-564e-bba1-ea48e22957e7.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_d957a4ed-0e2c-513b-86e8-ebe7eee7415d.name
  role_type = "Writer"
}

module "stackgen_4f36b9d8-f371-5645-8fec-0cbe343f23a0" {
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
  function_name         = "stackgen_242dcb-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_907c434f-f60f-564e-bba1-ea48e22957e7.name
  memory_size           = 128
  role                  = module.stackgen_d957a4ed-0e2c-513b-86e8-ebe7eee7415d.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_907c434f-f60f-564e-bba1-ea48e22957e7" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_242dcb-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_d957a4ed-0e2c-513b-86e8-ebe7eee7415d" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_242dcb-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

