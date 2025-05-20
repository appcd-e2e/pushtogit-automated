module "stackgen_01d42b38-9e39-5f87-9492-450216c6d362" {
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
  function_name         = "stackgen_1a88a5-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_78b3ba9d-26d9-5f8c-b082-00407738c337.name
  memory_size           = 128
  role                  = module.stackgen_4aea98b7-d5b1-5065-bf5a-4cc1c9592c67.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_4aea98b7-d5b1-5065-bf5a-4cc1c9592c67" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_1a88a5-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_78b3ba9d-26d9-5f8c-b082-00407738c337" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_1a88a5-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_85f154d3-99a8-4189-9eea-2f0b09b75e26" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_8fc247"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup78b3ba9d26d95f8cb08200407738c3370\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_78b3ba9d-26d9-5f8c-b082-00407738c337.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup78b3ba9d26d95f8cb08200407738c3371\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_78b3ba9d-26d9-5f8c-b082-00407738c337.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_4aea98b7-d5b1-5065-bf5a-4cc1c9592c67.name
  role_type = "Writer"
}

