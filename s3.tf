resource "aws_s3_bucket" "example" {
  bucket = "my-tfffff-test-bucket"

  tags = {
    Name        = "My bucket"
  }
}
