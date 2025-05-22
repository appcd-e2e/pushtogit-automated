module "stackgen_0a21d7b4-9e40-5099-b15d-0b3dc00d01bf" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_3c0201-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_b3add590-5a76-5dda-9513-c40a7639db3b" {
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
  function_name         = "stackgen_3c0201-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_f9c0b47a-9d55-501f-a190-c96d8f2b1658.name
  memory_size           = 128
  role                  = module.stackgen_0a21d7b4-9e40-5099-b15d-0b3dc00d01bf.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_e285490e-d009-48c2-9f2e-72bcc95b4741" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_573ffd"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupf9c0b47a9d55501fa190c96d8f2b16580\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_f9c0b47a-9d55-501f-a190-c96d8f2b1658.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupf9c0b47a9d55501fa190c96d8f2b16581\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_f9c0b47a-9d55-501f-a190-c96d8f2b1658.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_0a21d7b4-9e40-5099-b15d-0b3dc00d01bf.name
  role_type = "Writer"
}

module "stackgen_f9c0b47a-9d55-501f-a190-c96d8f2b1658" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_3c0201-function"
  retention_in_days = 7
  tags              = {}
}

