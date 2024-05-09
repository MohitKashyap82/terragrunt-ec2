resource "aws_kms_key" "test_kms_key" {
  description             = "test_kms_key"
  deletion_window_in_days = 10
}


resource "aws_kms_alias" "thousandeyes_key" {
  name          = "alias/thousandeyes_key"
  target_key_id = aws_kms_key.test_kms_key.id
}