module "stackgen_0ee56593-3563-551a-8744-83696acdf624" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_7f87bf-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_5cea0568-a8d4-5dfb-8eb1-e6d0b5cea65a" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_7f87bf-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_6588d5c5-c66d-5a10-b97e-0a376a7c461e" {
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
  function_name         = "stackgen_7f87bf-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_0ee56593-3563-551a-8744-83696acdf624.name
  memory_size           = 128
  role                  = module.stackgen_5cea0568-a8d4-5dfb-8eb1-e6d0b5cea65a.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_c1551957-bfdf-4c37-ad70-677d8eb5e57d" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_53391b"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup0ee565933563551a874483696acdf6240\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_0ee56593-3563-551a-8744-83696acdf624.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup0ee565933563551a874483696acdf6241\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_0ee56593-3563-551a-8744-83696acdf624.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_5cea0568-a8d4-5dfb-8eb1-e6d0b5cea65a.name
  role_type = "Writer"
}

