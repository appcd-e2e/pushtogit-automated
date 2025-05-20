module "stackgen_05f3fb84-8983-5348-8bb5-540660264372" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_981ea6-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_0834434f-d4bc-55ef-ad9a-7c56f9cf5ae6" {
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
  function_name         = "stackgen_981ea6-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_05f3fb84-8983-5348-8bb5-540660264372.name
  memory_size           = 128
  role                  = module.stackgen_ed6decfb-8e5d-5916-8377-b937cb9c12ce.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_1ca99c5b-e02b-464a-9370-c00678dd77d7" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_b56ebe"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup05f3fb84898353488bb55406602643720\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_05f3fb84-8983-5348-8bb5-540660264372.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup05f3fb84898353488bb55406602643721\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_05f3fb84-8983-5348-8bb5-540660264372.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_ed6decfb-8e5d-5916-8377-b937cb9c12ce.name
  role_type = "Writer"
}

module "stackgen_ed6decfb-8e5d-5916-8377-b937cb9c12ce" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_981ea6-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

