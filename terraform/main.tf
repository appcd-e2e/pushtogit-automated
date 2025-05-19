module "stackgen_59289a3e-e39f-5c58-8090-b9b4541e37f8" {
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
  function_name         = "stackgen_2ea389-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_dded60f3-275b-5401-9721-0604d11a777d.name
  memory_size           = 128
  role                  = module.stackgen_c6fdb19c-5617-5890-b4a0-d9166e7d87ae.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_789c3f18-f54d-4bcf-9f24-44c0eaa2b480" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_ccd281"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupdded60f3275b540197210604d11a777d0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_dded60f3-275b-5401-9721-0604d11a777d.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupdded60f3275b540197210604d11a777d1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_dded60f3-275b-5401-9721-0604d11a777d.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_c6fdb19c-5617-5890-b4a0-d9166e7d87ae.name
  role_type = "Writer"
}

module "stackgen_c6fdb19c-5617-5890-b4a0-d9166e7d87ae" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_2ea389-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_dded60f3-275b-5401-9721-0604d11a777d" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_2ea389-function"
  retention_in_days = 7
  tags              = {}
}

