resource "aws_s3_bucket" "staticwebsites3" {
  bucket = var.bucketname
}
resource "aws_s3_bucket_ownership_controls" "staticownership" {
  bucket = aws_s3_bucket.staticwebsites3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "staticpublic" {
  bucket = aws_s3_bucket.staticwebsites3.id
  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_acl" "staticacl" {
  bucket = aws_s3_bucket.staticwebsites3.id
depends_on = [
    aws_s3_bucket_ownership_controls.staticownership,
    aws_s3_bucket_public_access_block.staticpublic
 ]
   acl    = "public-read"
}

resource "aws_s3_object" "index" {
    key = "index.html"
    bucket = aws_s3_bucket.staticwebsites3.id
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
    key = "error.html"
    bucket = aws_s3_bucket.staticwebsites3.id
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.staticwebsites3.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  
}