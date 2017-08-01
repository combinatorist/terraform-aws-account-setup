# Note, this is the backend bucket for OTHER terraform projects in this account.
# You would have to manually create a bucket for this meta-project.
resource "aws_s3_bucket" "terraform_states"{
  bucket = "terraform-state-${uuid()}"
  region = "${var.region}"

  lifecycle {
    ignore_changes = ["bucket"]
  }
}
