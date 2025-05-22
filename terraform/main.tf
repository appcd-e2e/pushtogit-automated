module "stackgen_1fe603ce-304d-52c9-9c04-04054c64c8eb" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_fe4c9b-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_743b6b64-ffe1-5d41-84b9-ec9d09563a30" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_fe4c9b-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_945681e4-9851-5786-8ea3-2994baaef373" {
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
  function_name         = "stackgen_fe4c9b-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_1fe603ce-304d-52c9-9c04-04054c64c8eb.name
  memory_size           = 128
  role                  = module.stackgen_743b6b64-ffe1-5d41-84b9-ec9d09563a30.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_ded4974a-b4ae-4cba-876d-9b06e802d5d6" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_1b73ad"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup1fe603ce304d52c99c0404054c64c8eb0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_1fe603ce-304d-52c9-9c04-04054c64c8eb.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup1fe603ce304d52c99c0404054c64c8eb1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_1fe603ce-304d-52c9-9c04-04054c64c8eb.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_743b6b64-ffe1-5d41-84b9-ec9d09563a30.name
  role_type = "Writer"
}

