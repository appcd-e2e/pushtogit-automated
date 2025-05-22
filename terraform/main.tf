module "stackgen_010a6e3d-c82f-5df7-a980-3d5317a0ce13" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_e504ca-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_8c83ad20-5fc5-4986-a094-63165fde21b9" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_e8dd39"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup010a6e3dc82f5df7a9803d5317a0ce130\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_010a6e3d-c82f-5df7-a980-3d5317a0ce13.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup010a6e3dc82f5df7a9803d5317a0ce131\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_010a6e3d-c82f-5df7-a980-3d5317a0ce13.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_fda840a0-3ea3-5392-ab1d-7927cc2847e9.name
  role_type = "Writer"
}

module "stackgen_d50d2e3e-8472-5423-9245-0950e2a7c362" {
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
  function_name         = "stackgen_e504ca-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_010a6e3d-c82f-5df7-a980-3d5317a0ce13.name
  memory_size           = 128
  role                  = module.stackgen_fda840a0-3ea3-5392-ab1d-7927cc2847e9.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_fda840a0-3ea3-5392-ab1d-7927cc2847e9" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_e504ca-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

