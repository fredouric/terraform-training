provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "example" {
  ami                    = "ami-045a8ab02aadf4f88"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  user_data              = <<-EOF
    #!/bin/bash
    echo "Hello world!" > index.html
    nohup busybox httpd -f -p ${var.server_port} & 
    EOF

  user_data_replace_on_change = true
  tags = {
    "Name" = "terraform-example"
  }
}

variable "server_port" {
  description = "port used for HTTP listener"
  type        = number
  default     = 3000
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "public IP of instance"
}
