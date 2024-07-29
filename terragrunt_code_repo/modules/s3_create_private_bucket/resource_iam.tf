data "aws_iam_policy_document" "s3_bucket_access_policy_document" {
    statement {
      effect = "Allow"
      principals {
      type        = "AWS"
      identifiers = [
        "arn:aws:iam::519284387875:role/aws-reserved/sso.amazonaws.com/us-west-2/AWSReservedSSO_Operator_eb2ececab4719c0c"
        ]
      }
      actions = [
        "s3:PutObject",
        "s3:DeleteObject",
        "s3:ListBucket",
        "s3:GetObject",
        "s3:GetObjectVersion"
      ]
      resources = [
        aws_s3_bucket.s3_bucket.arn,
        "${aws_s3_bucket.s3_bucket.arn}/*",
      ]
    }
}

# resource "aws_iam_policy" "s3_bucket_access_policy" {
#   name = "${var.bucket_name}-s3-bucket-access"
#   policy = data.aws_iam_policy_document.s3_bucket_access_policy_document.json
# }

# data "aws_iam_policy_document" "s3_bucket_policy" {
#   source_policy_documents = compact(concat(
#     [var.additional_bucket_permissions],
#     []
#   ))
# }

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.s3_bucket_access_policy_document.json
}