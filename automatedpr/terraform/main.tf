module "stackgen_33d3d199-33c2-5ac5-8e61-2237caee9311" {
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
  function_name         = "stackgen_30bd5c-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_e39091b2-eeb3-5035-b201-03321ca1a07f.name
  memory_size           = 128
  role                  = module.stackgen_655e019e-bdfb-5a4e-8a98-bd5ebd074253.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_5aff9d11-ecc4-47f6-818c-9866c4e1b989" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_9835c3"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupe39091b2eeb35035b20103321ca1a07f0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_e39091b2-eeb3-5035-b201-03321ca1a07f.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupe39091b2eeb35035b20103321ca1a07f1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_e39091b2-eeb3-5035-b201-03321ca1a07f.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_655e019e-bdfb-5a4e-8a98-bd5ebd074253.name
  role_type = "Writer"
}

module "stackgen_655e019e-bdfb-5a4e-8a98-bd5ebd074253" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_30bd5c-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_e39091b2-eeb3-5035-b201-03321ca1a07f" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_30bd5c-function"
  retention_in_days = 7
  tags              = {}
}

