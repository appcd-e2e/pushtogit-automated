module "stackgen_1b583d8b-ead0-515f-9075-5b6defc9c9eb" {
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
  function_name         = "stackgen_8072b3-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_2696da22-f74c-5fd7-b200-412470e93d8d.name
  memory_size           = 128
  role                  = module.stackgen_3be5629e-f902-54fa-ab65-ff1da3383217.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_2696da22-f74c-5fd7-b200-412470e93d8d" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_8072b3-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_3be5629e-f902-54fa-ab65-ff1da3383217" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_8072b3-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_6684831d-097a-40cd-b232-8b256f4cc127" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_e75750"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup2696da22f74c5fd7b200412470e93d8d0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_2696da22-f74c-5fd7-b200-412470e93d8d.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup2696da22f74c5fd7b200412470e93d8d1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_2696da22-f74c-5fd7-b200-412470e93d8d.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_3be5629e-f902-54fa-ab65-ff1da3383217.name
  role_type = "Writer"
}

