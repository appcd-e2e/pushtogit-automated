module "stackgen_1d5bfc90-c470-561e-b33a-9ad0c117c2bf" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_5dc61b-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_40778c94-42a0-5d3d-90ea-991ba6893d95" {
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
  function_name         = "stackgen_5dc61b-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_c22eae3f-ce6e-5e36-9d37-a54d7c6bb947.name
  memory_size           = 128
  role                  = module.stackgen_1d5bfc90-c470-561e-b33a-9ad0c117c2bf.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_c130992a-0c73-452f-992c-ce4b536e316c" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_d8ba76"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupc22eae3fce6e5e369d37a54d7c6bb9470\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_c22eae3f-ce6e-5e36-9d37-a54d7c6bb947.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupc22eae3fce6e5e369d37a54d7c6bb9471\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_c22eae3f-ce6e-5e36-9d37-a54d7c6bb947.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_1d5bfc90-c470-561e-b33a-9ad0c117c2bf.name
  role_type = "Writer"
}

module "stackgen_c22eae3f-ce6e-5e36-9d37-a54d7c6bb947" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_5dc61b-function"
  retention_in_days = 7
  tags              = {}
}

