module "stackgen_0d146cdc-7517-504f-ba29-032836951f17" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_5535f7-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_64338dc4-f94b-5b9b-a89b-8014b89e4e41" {
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
  function_name         = "stackgen_5535f7-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = "$${module.stackgen_a42d04a0-7dec-5859-86da-d29de5860f15.name}"
  memory_size           = 128
  role                  = "$${module.stackgen_0d146cdc-7517-504f-ba29-032836951f17.arn}"
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_8bf37cc5-ee2a-4831-9bad-1ffe7a863134" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_e4b698"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupa42d04a07dec585986dad29de5860f150\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"$${module.stackgen_a42d04a0-7dec-5859-86da-d29de5860f15.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupa42d04a07dec585986dad29de5860f151\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"$${module.stackgen_a42d04a0-7dec-5859-86da-d29de5860f15.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = "$${module.stackgen_0d146cdc-7517-504f-ba29-032836951f17.name}"
  role_type = "Writer"
}

module "stackgen_a42d04a0-7dec-5859-86da-d29de5860f15" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_5535f7-function"
  retention_in_days = 7
  tags              = {}
}

