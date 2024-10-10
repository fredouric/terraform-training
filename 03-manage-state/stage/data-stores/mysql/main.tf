provider "aws" {
  region = "eu-west-3"
}

terraform {
  backend "s3" {
    bucket = "fredouric-tf-state"
    key    = "stage/data-stores/mysql"
    region = "eu-west-3"

    dynamodb_table = "terraform_locks"
    encrypt        = true

  }
}
resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t3.micro"
  skip_final_snapshot = true
  db_name             = "example_database"

  username = var.db_username
  password = var.db_password
}

