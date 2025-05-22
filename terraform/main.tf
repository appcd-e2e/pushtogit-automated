module "stackgen_4f823fba-87a3-5082-96c7-9df789e7526b" {
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
  function_name         = "stackgen_202f79-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_67e40cbe-6caa-55c6-859d-fea695c8ceb2.name
  memory_size           = 128
  role                  = module.stackgen_9ead6cb9-7a79-5a1f-a692-15a3486afd01.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_67e40cbe-6caa-55c6-859d-fea695c8ceb2" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_202f79-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_9ead6cb9-7a79-5a1f-a692-15a3486afd01" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_202f79-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_e55626d6-6ba7-4194-a0a2-e895af8e830f" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_03cdd4"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup67e40cbe6caa55c6859dfea695c8ceb20\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_67e40cbe-6caa-55c6-859d-fea695c8ceb2.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup67e40cbe6caa55c6859dfea695c8ceb21\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_67e40cbe-6caa-55c6-859d-fea695c8ceb2.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_9ead6cb9-7a79-5a1f-a692-15a3486afd01.name
  role_type = "Writer"
}

