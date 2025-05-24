module "stackgen_38de2339-8072-4bae-8bf0-1eff2a552ef7" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_c6c2d1"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupa115aeaa51f85b0aa9713f37437332d60\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_a115aeaa-51f8-5b0a-a971-3f37437332d6.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupa115aeaa51f85b0aa9713f37437332d61\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_a115aeaa-51f8-5b0a-a971-3f37437332d6.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_be87071b-580c-5ac4-b215-31b32ce6650f.name
  role_type = "Writer"
}

module "stackgen_8d4c923b-0a29-559b-80da-967c58c9fc0f" {
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
  function_name         = "stackgen_d027ec-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_a115aeaa-51f8-5b0a-a971-3f37437332d6.name
  memory_size           = 128
  role                  = module.stackgen_be87071b-580c-5ac4-b215-31b32ce6650f.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_a115aeaa-51f8-5b0a-a971-3f37437332d6" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_d027ec-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_be87071b-580c-5ac4-b215-31b32ce6650f" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_d027ec-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

