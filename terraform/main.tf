module "stackgen_096f6c0c-0c10-580d-9745-d7c8d332a0cd" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_7c6a18-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_5e610b10-02f3-527c-8a88-abe093d09f40" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_7c6a18-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_bf656d4f-82eb-5374-83f0-a279d2bb6f6c" {
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
  function_name         = "stackgen_7c6a18-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_096f6c0c-0c10-580d-9745-d7c8d332a0cd.name
  memory_size           = 128
  role                  = module.stackgen_5e610b10-02f3-527c-8a88-abe093d09f40.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_cf6c5717-03f2-47f4-9344-68e84f7f8606" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_b1a908"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup096f6c0c0c10580d9745d7c8d332a0cd0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_096f6c0c-0c10-580d-9745-d7c8d332a0cd.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup096f6c0c0c10580d9745d7c8d332a0cd1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_096f6c0c-0c10-580d-9745-d7c8d332a0cd.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_5e610b10-02f3-527c-8a88-abe093d09f40.name
  role_type = "Writer"
}

