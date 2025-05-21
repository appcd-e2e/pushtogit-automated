module "stackgen_23ec3811-f3f8-5739-b669-4b0eed788f15" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_e708a5-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_4737691d-049c-50fb-98f5-51fb6d5385f1" {
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
  function_name         = "stackgen_e708a5-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_23ec3811-f3f8-5739-b669-4b0eed788f15.name
  memory_size           = 128
  role                  = module.stackgen_5708b2f9-e11d-5e8e-ba04-30ad9c217205.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_5133c9d0-f46f-4ce6-923d-86e7d90e916c" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_ff523e"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup23ec3811f3f85739b6694b0eed788f150\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_23ec3811-f3f8-5739-b669-4b0eed788f15.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup23ec3811f3f85739b6694b0eed788f151\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_23ec3811-f3f8-5739-b669-4b0eed788f15.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_5708b2f9-e11d-5e8e-ba04-30ad9c217205.name
  role_type = "Writer"
}

module "stackgen_5708b2f9-e11d-5e8e-ba04-30ad9c217205" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_e708a5-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

