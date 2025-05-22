module "stackgen_13b8626f-16b6-5e97-897c-d3fc42fd0741" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_de58e9-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_4b9520e4-d403-414e-a898-b92fec114ae3" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_978251"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup13b8626f16b65e97897cd3fc42fd07410\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_13b8626f-16b6-5e97-897c-d3fc42fd0741.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup13b8626f16b65e97897cd3fc42fd07411\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_13b8626f-16b6-5e97-897c-d3fc42fd0741.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_c66c685e-b302-55da-92e0-bd2581400b10.name
  role_type = "Writer"
}

module "stackgen_5b6d56aa-1ca5-51f8-8708-fe7997e7b067" {
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
  function_name         = "stackgen_de58e9-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_13b8626f-16b6-5e97-897c-d3fc42fd0741.name
  memory_size           = 128
  role                  = module.stackgen_c66c685e-b302-55da-92e0-bd2581400b10.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_c66c685e-b302-55da-92e0-bd2581400b10" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_de58e9-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

