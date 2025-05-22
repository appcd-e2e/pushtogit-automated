module "stackgen_4944d27d-01d5-5902-9bd5-6bd2bb3658b6" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_bb425a-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_4d942712-9459-5706-a1d3-eb7c19c67617" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_bb425a-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_8789de76-b0b9-58fc-b32c-ccab3b679664" {
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
  function_name         = "stackgen_bb425a-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_4d942712-9459-5706-a1d3-eb7c19c67617.name
  memory_size           = 128
  role                  = module.stackgen_4944d27d-01d5-5902-9bd5-6bd2bb3658b6.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_b60f0eea-7d48-4cae-921d-7834fc562e94" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_b9fab7"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup4d94271294595706a1d3eb7c19c676170\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_4d942712-9459-5706-a1d3-eb7c19c67617.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup4d94271294595706a1d3eb7c19c676171\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_4d942712-9459-5706-a1d3-eb7c19c67617.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_4944d27d-01d5-5902-9bd5-6bd2bb3658b6.name
  role_type = "Writer"
}

