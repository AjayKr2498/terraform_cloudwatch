module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"
 
  ami                    = "ami-06a0b4e3b7eb7a300"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-02926808d26f2e308"]
  subnet_id              = "subnet-03f244e5c892205c6"

 


}