module "stackgen_42261fcf-c508-50dc-b09e-18178725897c" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_32ede7-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_76b8d7a2-691c-5da7-8afd-b51760f15c08" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_32ede7-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_c2858033-4980-57c0-b7a8-58bd6c267952" {
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
  function_name         = "stackgen_32ede7-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_76b8d7a2-691c-5da7-8afd-b51760f15c08.name
  memory_size           = 128
  role                  = module.stackgen_42261fcf-c508-50dc-b09e-18178725897c.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_e16c2e8e-9140-40e3-abd2-d1bec703369b" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_7cd3f4"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup76b8d7a2691c5da78afdb51760f15c080\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_76b8d7a2-691c-5da7-8afd-b51760f15c08.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup76b8d7a2691c5da78afdb51760f15c081\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_76b8d7a2-691c-5da7-8afd-b51760f15c08.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_42261fcf-c508-50dc-b09e-18178725897c.name
  role_type = "Writer"
}

