module "stackgen_0685d139-c5e3-5f9f-b2a3-b50b06399ac6" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_7d0eed-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_72f4591a-dac2-5c87-8971-97eabec921af" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_7d0eed-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_7cdc318c-49de-4166-88c4-7b123cc28814" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_1a576c"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup72f4591adac25c87897197eabec921af0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_72f4591a-dac2-5c87-8971-97eabec921af.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup72f4591adac25c87897197eabec921af1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_72f4591a-dac2-5c87-8971-97eabec921af.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_0685d139-c5e3-5f9f-b2a3-b50b06399ac6.name
  role_type = "Writer"
}

module "stackgen_eade6581-5d26-597f-80b5-ab7f34531654" {
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
  function_name         = "stackgen_7d0eed-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_72f4591a-dac2-5c87-8971-97eabec921af.name
  memory_size           = 128
  role                  = module.stackgen_0685d139-c5e3-5f9f-b2a3-b50b06399ac6.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

