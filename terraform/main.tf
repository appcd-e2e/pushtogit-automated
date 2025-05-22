module "stackgen_09232efc-475b-4e47-a9d5-e32be03e86f7" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_47a5ec"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupcb796124830b5e00a6f48520b6430b850\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_cb796124-830b-5e00-a6f4-8520b6430b85.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupcb796124830b5e00a6f48520b6430b851\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_cb796124-830b-5e00-a6f4-8520b6430b85.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_68a06f3a-2d0b-59e7-bc98-28e58703de97.name
  role_type = "Writer"
}

module "stackgen_0f17eb51-a7f1-536a-97e5-aa9ddf1f9443" {
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
  function_name         = "stackgen_f6311c-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_cb796124-830b-5e00-a6f4-8520b6430b85.name
  memory_size           = 128
  role                  = module.stackgen_68a06f3a-2d0b-59e7-bc98-28e58703de97.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_68a06f3a-2d0b-59e7-bc98-28e58703de97" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_f6311c-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_cb796124-830b-5e00-a6f4-8520b6430b85" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_f6311c-function"
  retention_in_days = 7
  tags              = {}
}

