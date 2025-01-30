data "aws_vpc" "terraform-aws-testing" {
  id = "vpc-0d23901ce2c16987c"
}

data "aws_subnet" "Terraform_Public_Subnet1-testing" {
  id = "subnet-03af76d2ed3720391"
}

data "aws_security_group" "allow_all" {
  id = "sg-0467511d2b54e515d"
}
