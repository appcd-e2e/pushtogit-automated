module "stackgen_0b666b9e-b78d-53f8-9eea-deeb4ca2a323" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_0444e8-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_40c32737-f8dd-5172-9c57-b922a8eaeee6" {
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
  function_name         = "stackgen_0444e8-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_f0558f05-21e1-569e-8ba8-ceb8fe0a3ce5.name
  memory_size           = 128
  role                  = module.stackgen_0b666b9e-b78d-53f8-9eea-deeb4ca2a323.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_890c6cc1-79a2-4a44-a7a3-3f6f3b38395b" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_707a45"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupf0558f0521e1569e8ba8ceb8fe0a3ce50\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_f0558f05-21e1-569e-8ba8-ceb8fe0a3ce5.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupf0558f0521e1569e8ba8ceb8fe0a3ce51\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_f0558f05-21e1-569e-8ba8-ceb8fe0a3ce5.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_0b666b9e-b78d-53f8-9eea-deeb4ca2a323.name
  role_type = "Writer"
}

module "stackgen_f0558f05-21e1-569e-8ba8-ceb8fe0a3ce5" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_0444e8-function"
  retention_in_days = 7
  tags              = {}
}

