provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "example" {
  ami           = "ami-0cb0b94275d5b4aec"
  instance_type = "t2.micro"
  tags = {
    "Name" = "terraform-example"
  }
}
