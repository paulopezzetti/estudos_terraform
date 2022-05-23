resource "aws_s3_bucket" "remotestate" {
  bucket = "remote-state-terraform"
  
  versioning {
    enabled = true
  }
}