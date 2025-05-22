module "stackgen_22434b80-e668-526b-87b2-ca92aeda0249" {
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
  function_name         = "stackgen_f0713a-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_615db6c2-2cf1-59ef-b909-28b7775ad73a.name
  memory_size           = 128
  role                  = module.stackgen_3d8ce920-2dd1-50d3-bd82-ab4f9e6f0020.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_3d8ce920-2dd1-50d3-bd82-ab4f9e6f0020" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_f0713a-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_615db6c2-2cf1-59ef-b909-28b7775ad73a" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_f0713a-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_9592b6e6-2249-4920-aa89-cdcd64958878" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_2e768e"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup615db6c22cf159efb90928b7775ad73a0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_615db6c2-2cf1-59ef-b909-28b7775ad73a.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup615db6c22cf159efb90928b7775ad73a1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_615db6c2-2cf1-59ef-b909-28b7775ad73a.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_3d8ce920-2dd1-50d3-bd82-ab4f9e6f0020.name
  role_type = "Writer"
}

