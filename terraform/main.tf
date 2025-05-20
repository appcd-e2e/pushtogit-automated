module "stackgen_79982a7a-6bf3-4d04-8369-c56b5c41e340" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_479542"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup80220fd4c5665b1d991460d28ab0cde90\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_80220fd4-c566-5b1d-9914-60d28ab0cde9.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup80220fd4c5665b1d991460d28ab0cde91\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_80220fd4-c566-5b1d-9914-60d28ab0cde9.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_f3f291b4-d287-512d-ac85-caa299c17f2c.name
  role_type = "Writer"
}

module "stackgen_80220fd4-c566-5b1d-9914-60d28ab0cde9" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_411f7b-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_9d3f0b60-0d19-51cd-a54c-029a86dbbd88" {
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
  function_name         = "stackgen_411f7b-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_80220fd4-c566-5b1d-9914-60d28ab0cde9.name
  memory_size           = 128
  role                  = module.stackgen_f3f291b4-d287-512d-ac85-caa299c17f2c.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_f3f291b4-d287-512d-ac85-caa299c17f2c" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_411f7b-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

