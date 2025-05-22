module "stackgen_331e2f92-74fd-5c13-88ed-e8cae09555aa" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_8abf0e-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_5595afff-e937-5043-bb21-204c564fbcfc" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_8abf0e-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_84a83392-6979-5ca3-af58-b445f53bda36" {
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
  function_name         = "stackgen_8abf0e-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_5595afff-e937-5043-bb21-204c564fbcfc.name
  memory_size           = 128
  role                  = module.stackgen_331e2f92-74fd-5c13-88ed-e8cae09555aa.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_ec5bd096-d55e-4495-b3c5-e59d3af212fd" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_f2cd75"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup5595afffe9375043bb21204c564fbcfc0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_5595afff-e937-5043-bb21-204c564fbcfc.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup5595afffe9375043bb21204c564fbcfc1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_5595afff-e937-5043-bb21-204c564fbcfc.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_331e2f92-74fd-5c13-88ed-e8cae09555aa.name
  role_type = "Writer"
}

