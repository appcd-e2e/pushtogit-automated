module "stackgen_2b58c49a-e0fd-5871-9315-53b8674825ea" {
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
  function_name         = "stackgen_736b2e-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_e7f3b522-7ea9-5435-9d60-1991ac0d9f28.name
  memory_size           = 128
  role                  = module.stackgen_4121fbc2-4d0a-5eec-b595-06dae52c17a1.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_4121fbc2-4d0a-5eec-b595-06dae52c17a1" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_736b2e-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_499628a4-d553-4f59-950c-662e685e6ba1" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_b83f0b"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupe7f3b5227ea954359d601991ac0d9f280\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_e7f3b522-7ea9-5435-9d60-1991ac0d9f28.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupe7f3b5227ea954359d601991ac0d9f281\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_e7f3b522-7ea9-5435-9d60-1991ac0d9f28.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_4121fbc2-4d0a-5eec-b595-06dae52c17a1.name
  role_type = "Writer"
}

module "stackgen_e7f3b522-7ea9-5435-9d60-1991ac0d9f28" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_736b2e-function"
  retention_in_days = 7
  tags              = {}
}

