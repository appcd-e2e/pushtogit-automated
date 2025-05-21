module "stackgen_20994928-da90-5f85-b519-3d5fedbe7781" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_29ca64-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_53af8632-8275-507d-903b-7775835e0735" {
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
  function_name         = "stackgen_29ca64-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_8c642693-698a-549c-8020-a7346fac0a7c.name
  memory_size           = 128
  role                  = module.stackgen_20994928-da90-5f85-b519-3d5fedbe7781.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_55d7035b-d67f-431b-8ef3-1f4872f3c743" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_20860e"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup8c642693698a549c8020a7346fac0a7c0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_8c642693-698a-549c-8020-a7346fac0a7c.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup8c642693698a549c8020a7346fac0a7c1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_8c642693-698a-549c-8020-a7346fac0a7c.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_20994928-da90-5f85-b519-3d5fedbe7781.name
  role_type = "Writer"
}

module "stackgen_8c642693-698a-549c-8020-a7346fac0a7c" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_29ca64-function"
  retention_in_days = 7
  tags              = {}
}

