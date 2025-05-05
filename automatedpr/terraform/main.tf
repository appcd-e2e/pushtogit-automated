module "stackgen_0d47ef64-da68-4bd9-97fb-918a75c58ce6" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_f1f3f7"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupc05173ab6c435f28b7f1ceb03cf49c990\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"$${module.stackgen_c05173ab-6c43-5f28-b7f1-ceb03cf49c99.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupc05173ab6c435f28b7f1ceb03cf49c991\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"$${module.stackgen_c05173ab-6c43-5f28-b7f1-ceb03cf49c99.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = "$${module.stackgen_ac560a23-af49-5552-83f8-928539e2f8fd.name}"
  role_type = "Writer"
}

module "stackgen_ac560a23-af49-5552-83f8-928539e2f8fd" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_91f0ed-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_c05173ab-6c43-5f28-b7f1-ceb03cf49c99" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_91f0ed-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_ec52f7ae-6278-5b0a-8f66-e214f1019332" {
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
  function_name         = "stackgen_91f0ed-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = "$${module.stackgen_c05173ab-6c43-5f28-b7f1-ceb03cf49c99.name}"
  memory_size           = 128
  role                  = "$${module.stackgen_ac560a23-af49-5552-83f8-928539e2f8fd.arn}"
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

