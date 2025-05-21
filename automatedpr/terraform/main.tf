module "stackgen_32e04041-4442-4d50-be8a-6f092adf159e" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_64fccb"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupb0ee254bea66554fb03ee21c07d4603e0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_b0ee254b-ea66-554f-b03e-e21c07d4603e.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupb0ee254bea66554fb03ee21c07d4603e1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_b0ee254b-ea66-554f-b03e-e21c07d4603e.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_37fc9385-44a9-5e9f-bd2d-35fb20c2dfb0.name
  role_type = "Writer"
}

module "stackgen_37fc9385-44a9-5e9f-bd2d-35fb20c2dfb0" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_42a463-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_40b31fd5-dac2-5bf4-a788-468d1ff1625d" {
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
  function_name         = "stackgen_42a463-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_b0ee254b-ea66-554f-b03e-e21c07d4603e.name
  memory_size           = 128
  role                  = module.stackgen_37fc9385-44a9-5e9f-bd2d-35fb20c2dfb0.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_b0ee254b-ea66-554f-b03e-e21c07d4603e" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_42a463-function"
  retention_in_days = 7
  tags              = {}
}

