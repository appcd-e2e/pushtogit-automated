module "stackgen_473571a9-6842-516a-81b2-773d0b9fc519" {
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
  function_name         = "stackgen_34b75c-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = "$${module.stackgen_e0ca2bd6-b8d7-5c70-a0e4-184046cc3de5.name}"
  memory_size           = 128
  role                  = "$${module.stackgen_63cf05f3-c54a-57b3-a4bd-7d08c15d2a82.arn}"
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_5f4a34e9-2c83-4b24-9d1b-410c39102763" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_dd1705"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupe0ca2bd6b8d75c70a0e4184046cc3de50\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"$${module.stackgen_e0ca2bd6-b8d7-5c70-a0e4-184046cc3de5.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupe0ca2bd6b8d75c70a0e4184046cc3de51\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"$${module.stackgen_e0ca2bd6-b8d7-5c70-a0e4-184046cc3de5.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = "$${module.stackgen_63cf05f3-c54a-57b3-a4bd-7d08c15d2a82.name}"
  role_type = "Writer"
}

module "stackgen_63cf05f3-c54a-57b3-a4bd-7d08c15d2a82" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_34b75c-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_e0ca2bd6-b8d7-5c70-a0e4-184046cc3de5" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_34b75c-function"
  retention_in_days = 7
  tags              = {}
}

