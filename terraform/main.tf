module "stackgen_5063701c-245d-525f-aeb6-cc53b013d02d" {
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
  function_name         = "stackgen_e2c1e8-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_febe5f33-0576-57a9-99c7-f86861411c51.name
  memory_size           = 128
  role                  = module.stackgen_771e4923-cc94-5cb0-b2c2-c1385f2a61c8.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_771e4923-cc94-5cb0-b2c2-c1385f2a61c8" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_e2c1e8-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_cc77af39-c4e2-4934-af12-52a1e9c106ce" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_1421e9"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupfebe5f33057657a999c7f86861411c510\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_febe5f33-0576-57a9-99c7-f86861411c51.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupfebe5f33057657a999c7f86861411c511\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_febe5f33-0576-57a9-99c7-f86861411c51.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_771e4923-cc94-5cb0-b2c2-c1385f2a61c8.name
  role_type = "Writer"
}

module "stackgen_febe5f33-0576-57a9-99c7-f86861411c51" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_e2c1e8-function"
  retention_in_days = 7
  tags              = {}
}

