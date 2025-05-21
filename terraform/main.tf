module "stackgen_0a126192-140c-5ce7-8b8d-e15e28f6f2cb" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_31a8a3-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_12141c5a-8dad-47c1-9758-3d1b63c3661e" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_a64c8c"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup253d18edfd8c51ae970df480ed5fb3200\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_253d18ed-fd8c-51ae-970d-f480ed5fb320.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup253d18edfd8c51ae970df480ed5fb3201\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_253d18ed-fd8c-51ae-970d-f480ed5fb320.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_0a126192-140c-5ce7-8b8d-e15e28f6f2cb.name
  role_type = "Writer"
}

module "stackgen_253d18ed-fd8c-51ae-970d-f480ed5fb320" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_31a8a3-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_3c9d6bd2-fc20-539a-b276-78fc10aba586" {
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
  function_name         = "stackgen_31a8a3-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_253d18ed-fd8c-51ae-970d-f480ed5fb320.name
  memory_size           = 128
  role                  = module.stackgen_0a126192-140c-5ce7-8b8d-e15e28f6f2cb.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

