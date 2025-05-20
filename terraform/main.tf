module "stackgen_1a526373-fd93-5db1-bb49-576d44a297c1" {
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
  function_name         = "stackgen_5a5238-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_7a8ab6ae-6338-5b01-aecb-c4587851e20b.name
  memory_size           = 128
  role                  = module.stackgen_6f78da9d-fbdc-576d-a925-5d45ca8b9e5e.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_6f78da9d-fbdc-576d-a925-5d45ca8b9e5e" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_5a5238-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_7a8ab6ae-6338-5b01-aecb-c4587851e20b" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_5a5238-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_823e3123-d119-4307-90b1-db6cc167fc0b" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_91a2c6"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup7a8ab6ae63385b01aecbc4587851e20b0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_7a8ab6ae-6338-5b01-aecb-c4587851e20b.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup7a8ab6ae63385b01aecbc4587851e20b1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_7a8ab6ae-6338-5b01-aecb-c4587851e20b.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_6f78da9d-fbdc-576d-a925-5d45ca8b9e5e.name
  role_type = "Writer"
}

