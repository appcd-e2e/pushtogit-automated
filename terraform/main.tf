module "stackgen_23814065-a8a1-5320-bcfd-73ddd79a3e1c" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_9006ec-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_4722bdb1-51d9-45b0-a6ad-eddf704ac8db" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_8c80a3"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup23814065a8a15320bcfd73ddd79a3e1c0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_23814065-a8a1-5320-bcfd-73ddd79a3e1c.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup23814065a8a15320bcfd73ddd79a3e1c1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_23814065-a8a1-5320-bcfd-73ddd79a3e1c.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_a5315c65-d6be-5568-9574-e0beee0f5bd9.name
  role_type = "Writer"
}

module "stackgen_863e2949-4583-52e2-b61b-e89e30f05f37" {
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
  function_name         = "stackgen_9006ec-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_23814065-a8a1-5320-bcfd-73ddd79a3e1c.name
  memory_size           = 128
  role                  = module.stackgen_a5315c65-d6be-5568-9574-e0beee0f5bd9.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_a5315c65-d6be-5568-9574-e0beee0f5bd9" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_9006ec-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

