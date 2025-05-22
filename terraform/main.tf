module "stackgen_363f865e-52eb-47c8-ac24-7de77d0558a8" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_1b95da"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupa76c5598b15e5b379357c2fde3421bd40\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_a76c5598-b15e-5b37-9357-c2fde3421bd4.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupa76c5598b15e5b379357c2fde3421bd41\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_a76c5598-b15e-5b37-9357-c2fde3421bd4.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_6b73fd1a-ce69-576e-85e9-b8af9b1690ec.name
  role_type = "Writer"
}

module "stackgen_6b73fd1a-ce69-576e-85e9-b8af9b1690ec" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_0335cf-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_a76c5598-b15e-5b37-9357-c2fde3421bd4" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_0335cf-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_d0669bd8-afa4-5a33-bb5d-fd46ed414c04" {
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
  function_name         = "stackgen_0335cf-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_a76c5598-b15e-5b37-9357-c2fde3421bd4.name
  memory_size           = 128
  role                  = module.stackgen_6b73fd1a-ce69-576e-85e9-b8af9b1690ec.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

