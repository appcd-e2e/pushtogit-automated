module "stackgen_54f5f8b3-87bc-57eb-9a7c-87391eefaed2" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_65406e-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_e9c8b11c-b603-5a0b-8aa6-777402249447" {
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
  function_name         = "stackgen_65406e-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_54f5f8b3-87bc-57eb-9a7c-87391eefaed2.name
  memory_size           = 128
  role                  = module.stackgen_f87f49c7-510a-5941-8ef5-5b8f0106c172.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_ea040ca4-38fb-448c-99eb-38364fae3084" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_f7620e"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup54f5f8b387bc57eb9a7c87391eefaed20\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_54f5f8b3-87bc-57eb-9a7c-87391eefaed2.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup54f5f8b387bc57eb9a7c87391eefaed21\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_54f5f8b3-87bc-57eb-9a7c-87391eefaed2.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_f87f49c7-510a-5941-8ef5-5b8f0106c172.name
  role_type = "Writer"
}

module "stackgen_f87f49c7-510a-5941-8ef5-5b8f0106c172" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_65406e-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

