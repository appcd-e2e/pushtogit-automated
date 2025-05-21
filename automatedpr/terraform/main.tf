module "stackgen_17107713-e650-5ca0-a7a1-8433780fcf43" {
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
  function_name         = "stackgen_86e20d-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_dc6229b8-18e3-521e-9039-e19d75f2ec75.name
  memory_size           = 128
  role                  = module.stackgen_7d6aab05-4cf7-55b3-a65d-b05c164ca1df.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_4666d5e8-cc15-40d9-b7ef-5979a6537174" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_afaa45"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupdc6229b818e3521e9039e19d75f2ec750\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_dc6229b8-18e3-521e-9039-e19d75f2ec75.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupdc6229b818e3521e9039e19d75f2ec751\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_dc6229b8-18e3-521e-9039-e19d75f2ec75.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_7d6aab05-4cf7-55b3-a65d-b05c164ca1df.name
  role_type = "Writer"
}

module "stackgen_7d6aab05-4cf7-55b3-a65d-b05c164ca1df" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_86e20d-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_dc6229b8-18e3-521e-9039-e19d75f2ec75" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_86e20d-function"
  retention_in_days = 7
  tags              = {}
}

