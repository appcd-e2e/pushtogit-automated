module "stackgen_4fcf4556-ade2-55ad-840b-7548abd6fd08" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_557a8e-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_9ef5b191-7373-4942-961f-1a2d4e2bf403" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_ed6394"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupd61662fb494159dbb7164fae7f9e67710\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_d61662fb-4941-59db-b716-4fae7f9e6771.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupd61662fb494159dbb7164fae7f9e67711\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_d61662fb-4941-59db-b716-4fae7f9e6771.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_4fcf4556-ade2-55ad-840b-7548abd6fd08.name
  role_type = "Writer"
}

module "stackgen_d251d437-507d-5ca1-a3de-6ff60f6d361f" {
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
  function_name         = "stackgen_557a8e-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_d61662fb-4941-59db-b716-4fae7f9e6771.name
  memory_size           = 128
  role                  = module.stackgen_4fcf4556-ade2-55ad-840b-7548abd6fd08.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_d61662fb-4941-59db-b716-4fae7f9e6771" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_557a8e-function"
  retention_in_days = 7
  tags              = {}
}

