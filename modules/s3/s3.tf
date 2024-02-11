resource "aws_s3_bucket" "bucket_global" {
  bucket = "terraform-global-${random_string.random_name.result}"

}


resource "random_string" "random_name" {
  length  = 10
  special = false
  upper   = false
  numeric  = false
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption_global" {
  bucket = aws_s3_bucket.bucket_global.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

resource "aws_s3_bucket_policy" "global_policy" {
   bucket = aws_s3_bucket.bucket_global.id
   depends_on = [aws_s3_bucket.bucket_global]
   policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
       "Sid"       : "AllowOwnerFullAcess",
       "Effect"    : "Allow",
       "Principal" : {
          "AWS": [
            "${data.aws_caller_identity.current.arn}"
          ]
        },
       "Action"    : "s3:*",
       "Resource"  : [
          "${aws_s3_bucket.bucket_global.arn}",
          "${aws_s3_bucket.bucket_global.arn}/*"
        ]
      },
      {
        "Sid"     : "AllowOtherDefaultPermissions",
        "Effect"    : "Allow",
        "Principal" : {
          "AWS": [
                #  for user in data.aws_iam_users.all.names :  "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${user}"
                  for user in data.aws_iam_users.all.names :  "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${user}" if user != local.current_username
               #  for user in data.aws_iam_users.all.names : user != local.current_username ? "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${user}" : null
          ]
        },
        "Action"    : [
          "s3:ListBucket",
          "s3:GetObject"
        ],
        "Resource"  : [
          "${aws_s3_bucket.bucket_global.arn}",
          "${aws_s3_bucket.bucket_global.arn}/*"
        ]
      }
    ]
  })
}
