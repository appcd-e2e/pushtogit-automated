module "stackgen_629d78d1-ac02-458a-8c77-a935d2722f30" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_dd29b3"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupcc7e9501974e5587994baae14e62e10b0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_cc7e9501-974e-5587-994b-aae14e62e10b.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupcc7e9501974e5587994baae14e62e10b1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_cc7e9501-974e-5587-994b-aae14e62e10b.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_caab67db-7fc4-540a-8af7-92d4e0e059aa.name
  role_type = "Writer"
}

module "stackgen_caab67db-7fc4-540a-8af7-92d4e0e059aa" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_790a6e-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_cc7e9501-974e-5587-994b-aae14e62e10b" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_790a6e-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_d9977b6a-3692-5047-a54c-584bfd7affb4" {
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
  function_name         = "stackgen_790a6e-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_cc7e9501-974e-5587-994b-aae14e62e10b.name
  memory_size           = 128
  role                  = module.stackgen_caab67db-7fc4-540a-8af7-92d4e0e059aa.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

