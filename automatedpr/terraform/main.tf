module "stackgen_99441f7c-afd5-5ad5-9785-5f40534de6e7" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_850ecf-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_ac5c44cc-d94d-56a7-a8d2-76802a2d1175" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_850ecf-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_b97f4e13-541b-49bc-a712-013d1561b344" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_d81ff2"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroupac5c44ccd94d56a7a8d276802a2d11750\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_ac5c44cc-d94d-56a7-a8d2-76802a2d1175.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroupac5c44ccd94d56a7a8d276802a2d11751\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_ac5c44cc-d94d-56a7-a8d2-76802a2d1175.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_99441f7c-afd5-5ad5-9785-5f40534de6e7.name
  role_type = "Writer"
}

module "stackgen_cda4a91d-e51f-547e-8666-152ecfbe0581" {
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
  function_name         = "stackgen_850ecf-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_ac5c44cc-d94d-56a7-a8d2-76802a2d1175.name
  memory_size           = 128
  role                  = module.stackgen_99441f7c-afd5-5ad5-9785-5f40534de6e7.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

