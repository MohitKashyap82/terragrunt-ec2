data "aws_secretsmanager_secret" "thousandeyes-key" {
  name = "thousandeyes-key"
}

data "aws_secretsmanager_secret_version" "secret-version" {
  secret_id = data.aws_secretsmanager_secret.thousandeyes-key.id
}