module "stackgen_76545b00-bad9-5701-b5fd-40d4a35de90b" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_b1016b-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_91f7628a-515d-5f04-9e45-affe7bedc249" {
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
  function_name         = "stackgen_b1016b-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_76545b00-bad9-5701-b5fd-40d4a35de90b.name
  memory_size           = 128
  role                  = module.stackgen_e2781879-93db-51e8-9f47-0bca12ae2eb2.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_da30835a-b27f-4dd6-836f-f660288ac969" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_6b6a10"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup76545b00bad95701b5fd40d4a35de90b0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_76545b00-bad9-5701-b5fd-40d4a35de90b.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup76545b00bad95701b5fd40d4a35de90b1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_76545b00-bad9-5701-b5fd-40d4a35de90b.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_e2781879-93db-51e8-9f47-0bca12ae2eb2.name
  role_type = "Writer"
}

module "stackgen_e2781879-93db-51e8-9f47-0bca12ae2eb2" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_b1016b-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

