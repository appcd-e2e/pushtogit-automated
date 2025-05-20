module "stackgen_472be3ac-767a-5fbd-9445-683a37a565af" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_a74957-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_721d387d-4104-4c46-bb80-e4fe90ed1453" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_15a3f3"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup7d040e5eab3c577388e6f4ae0fe9abda0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_7d040e5e-ab3c-5773-88e6-f4ae0fe9abda.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup7d040e5eab3c577388e6f4ae0fe9abda1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_7d040e5e-ab3c-5773-88e6-f4ae0fe9abda.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_472be3ac-767a-5fbd-9445-683a37a565af.name
  role_type = "Writer"
}

module "stackgen_7d040e5e-ab3c-5773-88e6-f4ae0fe9abda" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_a74957-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_c7dc9817-4731-5925-92a6-9ae3b2fcde7a" {
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
  function_name         = "stackgen_a74957-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_7d040e5e-ab3c-5773-88e6-f4ae0fe9abda.name
  memory_size           = 128
  role                  = module.stackgen_472be3ac-767a-5fbd-9445-683a37a565af.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

