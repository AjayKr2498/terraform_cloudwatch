terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-054965c6cd7c6e462"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = eni-071e98d9966beb24e
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}