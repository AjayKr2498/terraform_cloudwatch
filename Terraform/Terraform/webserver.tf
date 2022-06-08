terraform {
  required_providers {
    aws = {
      soruce  = "hashicrop/aws"
      version = "->3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"


}

resource "aws-instance" "app_server" {
  ami           = "ami-054965c6cd7c6e462"
  instance_type = "t2.micro"

  tags = {
    name = "ExampleAppServer"
  }

}
