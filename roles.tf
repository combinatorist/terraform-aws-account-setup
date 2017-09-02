# Terraform treats assume role policies specially and does not provide a way to attach
# I created a role in AWS console to reverse-engineer the assume role policy.

# doesn't work yet assume roles are mysterious
data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda" {
  name = "lambda_role"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role.json}"
}

resource "aws_iam_role_policy_attachment" "lambda_s3" {
    role       = "${aws_iam_role.lambda.name}"
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
