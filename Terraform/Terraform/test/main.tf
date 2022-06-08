terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {

  profile       = "default"
  region        = "us-west-2"
  Access_key_ID = "AKIATCJUZZOCVBNZC47V"
}



resource "aws_instance" "app_server" {
  ami                    = "ami-054965c6cd7c6e462"
  instance_type          = "t2.micro"
  vpc_security_group_ids = "vpc-000818b0752a98ce3"


  network_interface {
    network_interface_id = eni-071e98d9966beb24e

  }


}


module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-054965c6cd7c6e462"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["vpc-000818b0752a98ce3"]
  subnet_id              = "subnet-03f244e5c892205c6"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}