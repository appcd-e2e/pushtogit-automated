module "stackgen_087db2d7-6c50-5726-96df-8dc1f8b89c2a" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_c7187a-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_506eaa4a-e575-4964-a2ec-b8b1bc204bb9" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_09325b"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupe41690f9ccfb55d39b5de9b7b8a5edd60\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_e41690f9-ccfb-55d3-9b5d-e9b7b8a5edd6.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupe41690f9ccfb55d39b5de9b7b8a5edd61\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_e41690f9-ccfb-55d3-9b5d-e9b7b8a5edd6.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_087db2d7-6c50-5726-96df-8dc1f8b89c2a.name
  role_type = "Writer"
}

module "stackgen_76cbbaa2-6b91-5dca-a100-0bc8347bebe0" {
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
  function_name         = "stackgen_c7187a-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_e41690f9-ccfb-55d3-9b5d-e9b7b8a5edd6.name
  memory_size           = 128
  role                  = module.stackgen_087db2d7-6c50-5726-96df-8dc1f8b89c2a.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_e41690f9-ccfb-55d3-9b5d-e9b7b8a5edd6" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_c7187a-function"
  retention_in_days = 7
  tags              = {}
}

