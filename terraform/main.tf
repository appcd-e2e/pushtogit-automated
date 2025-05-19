module "stackgen_13a18998-b191-5d5f-bdea-556c76e4aec6" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_c5e140-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_1eedeec7-b6b3-4edd-a49e-2a90bfc95ed0" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_43a8ff"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup40556aa29a71589d82a717c85ede68170\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_40556aa2-9a71-589d-82a7-17c85ede6817.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup40556aa29a71589d82a717c85ede68171\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_40556aa2-9a71-589d-82a7-17c85ede6817.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_13a18998-b191-5d5f-bdea-556c76e4aec6.name
  role_type = "Writer"
}

module "stackgen_40556aa2-9a71-589d-82a7-17c85ede6817" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_c5e140-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_ffce5cf8-b8b0-5234-91af-50b3a5b9b300" {
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
  function_name         = "stackgen_c5e140-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_40556aa2-9a71-589d-82a7-17c85ede6817.name
  memory_size           = 128
  role                  = module.stackgen_13a18998-b191-5d5f-bdea-556c76e4aec6.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

