terraform {
  backend "s3" {
    # 具体值在 CI 中通过 -backend-config 注入
    encrypt        = true
    key            = "ec2/terraform.tfstate"
    region         = "us-east-1"
  }
}