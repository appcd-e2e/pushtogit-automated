module "stackgen_473536b3-f005-4781-830a-1ea559d58097" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_c61374"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupe70bf8c4d4cd515a81c19a7993c63bf60\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_e70bf8c4-d4cd-515a-81c1-9a7993c63bf6.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupe70bf8c4d4cd515a81c19a7993c63bf61\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_e70bf8c4-d4cd-515a-81c1-9a7993c63bf6.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_785026f1-2187-552f-802b-1f9598023dec.name
  role_type = "Writer"
}

module "stackgen_785026f1-2187-552f-802b-1f9598023dec" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_bfd539-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_b1f1bca9-f8aa-553b-bc0d-b13b16d66d0e" {
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
  function_name         = "stackgen_bfd539-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_e70bf8c4-d4cd-515a-81c1-9a7993c63bf6.name
  memory_size           = 128
  role                  = module.stackgen_785026f1-2187-552f-802b-1f9598023dec.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_e70bf8c4-d4cd-515a-81c1-9a7993c63bf6" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_bfd539-function"
  retention_in_days = 7
  tags              = {}
}

