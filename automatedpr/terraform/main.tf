module "stackgen_0cb7cd71-1132-565a-8341-71ad37575416" {
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
  function_name         = "stackgen_a9d456-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_a4bcdbd9-d202-5507-a9b1-164ccd21d828.name
  memory_size           = 128
  role                  = module.stackgen_91663fef-eb8f-5fec-ba79-1a931a103f0c.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_21289888-724d-4931-bb9f-a355a25d866b" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_914f17"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupa4bcdbd9d2025507a9b1164ccd21d8280\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_a4bcdbd9-d202-5507-a9b1-164ccd21d828.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupa4bcdbd9d2025507a9b1164ccd21d8281\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_a4bcdbd9-d202-5507-a9b1-164ccd21d828.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_91663fef-eb8f-5fec-ba79-1a931a103f0c.name
  role_type = "Writer"
}

module "stackgen_91663fef-eb8f-5fec-ba79-1a931a103f0c" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_a9d456-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_a4bcdbd9-d202-5507-a9b1-164ccd21d828" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_a9d456-function"
  retention_in_days = 7
  tags              = {}
}

