module "stackgen_089f679c-e3ee-5655-904b-b25cc0b0d8c0" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_99c424-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_97e4231a-0d71-5ac2-a31d-90c3685fa06d" {
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
  function_name         = "stackgen_99c424-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_e02176df-291a-54dd-b1ac-c789661d4a07.name
  memory_size           = 128
  role                  = module.stackgen_089f679c-e3ee-5655-904b-b25cc0b0d8c0.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_e02176df-291a-54dd-b1ac-c789661d4a07" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_99c424-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_fc5915af-4717-4356-ae41-2844818b265d" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_f2c3cf"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupe02176df291a54ddb1acc789661d4a070\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_e02176df-291a-54dd-b1ac-c789661d4a07.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupe02176df291a54ddb1acc789661d4a071\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_e02176df-291a-54dd-b1ac-c789661d4a07.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_089f679c-e3ee-5655-904b-b25cc0b0d8c0.name
  role_type = "Writer"
}

