module "stackgen_498d21e2-f0cc-4b2e-ad03-f42b14984ec8" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_47fbfb"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup9dea1932c8a8590abc592702c99f53ca0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_9dea1932-c8a8-590a-bc59-2702c99f53ca.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup9dea1932c8a8590abc592702c99f53ca1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_9dea1932-c8a8-590a-bc59-2702c99f53ca.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_82f47341-c922-56f0-9485-b2c3f33cbea7.name
  role_type = "Writer"
}

module "stackgen_82f47341-c922-56f0-9485-b2c3f33cbea7" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_822e6c-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_9dea1932-c8a8-590a-bc59-2702c99f53ca" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_822e6c-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_c9341631-ad6e-5335-bc59-d20a023ac442" {
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
  function_name         = "stackgen_822e6c-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_9dea1932-c8a8-590a-bc59-2702c99f53ca.name
  memory_size           = 128
  role                  = module.stackgen_82f47341-c922-56f0-9485-b2c3f33cbea7.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

