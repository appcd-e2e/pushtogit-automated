module "stackgen_7778a18f-1436-52cf-bb8d-f0a15710fd05" {
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
  function_name         = "stackgen_e4e75a-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_a1f841aa-cabf-5a85-8c8c-65745666c2f8.name
  memory_size           = 128
  role                  = module.stackgen_9a5b651e-5e27-5ee8-aa69-69a19adc78bc.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_79141159-6fa0-4096-ba85-e8d418b3cdcf" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_4a8708"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupa1f841aacabf5a858c8c65745666c2f80\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_a1f841aa-cabf-5a85-8c8c-65745666c2f8.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupa1f841aacabf5a858c8c65745666c2f81\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_a1f841aa-cabf-5a85-8c8c-65745666c2f8.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_9a5b651e-5e27-5ee8-aa69-69a19adc78bc.name
  role_type = "Writer"
}

module "stackgen_9a5b651e-5e27-5ee8-aa69-69a19adc78bc" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_e4e75a-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_a1f841aa-cabf-5a85-8c8c-65745666c2f8" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_e4e75a-function"
  retention_in_days = 7
  tags              = {}
}

