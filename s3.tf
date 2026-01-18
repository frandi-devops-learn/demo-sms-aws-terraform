resource "aws_s3_bucket" "private_storage" {
  bucket        = "demo-sms-internal-storage"
  force_destroy = false

  tags = local.common_tags
}

resource "aws_s3_bucket_public_access_block" "private_storage_block" {
  bucket = aws_s3_bucket.private_storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "private_storage_encrypt" {
  bucket = aws_s3_bucket.private_storage.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}