module "stackgen_06f4c4bd-ac85-4c28-b1ca-6fb740259c61" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_918db9"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup487760c25acf531cbc3a908e5c35061f0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_487760c2-5acf-531c-bc3a-908e5c35061f.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup487760c25acf531cbc3a908e5c35061f1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_487760c2-5acf-531c-bc3a-908e5c35061f.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_a50dc035-376b-5887-a0f9-7656f05ccac3.name
  role_type = "Writer"
}

module "stackgen_487760c2-5acf-531c-bc3a-908e5c35061f" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_e256e4-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_707cd6c5-778e-5c00-add8-9edb670ec231" {
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
  function_name         = "stackgen_e256e4-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_487760c2-5acf-531c-bc3a-908e5c35061f.name
  memory_size           = 128
  role                  = module.stackgen_a50dc035-376b-5887-a0f9-7656f05ccac3.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_a50dc035-376b-5887-a0f9-7656f05ccac3" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_e256e4-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

