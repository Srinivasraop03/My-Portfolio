provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "portfolio_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
  instance_type = "t2.micro"
  key_name      = "your-key-pair"
  
  tags = {
    Name = "PortfolioServer"
  }
  
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install docker -y
              service docker start
              usermod -a -G docker ec2-user
              EOF
}
