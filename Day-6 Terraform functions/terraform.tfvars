aws_region         = "us-east-1"
vpc_cidr           = "172.18.0.0/16"
vpc_name           = "DevOpsVPC"
key_name           = "DevOps"
azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
Public_cidr_block  = ["172.18.1.0/24", "172.18.2.0/24", "172.18.3.0/24"]
Private_cidr_block = ["172.18.10.0/24", "172.18.20.0/24", "172.18.30.0/24"]
environment        = "Dev"
ingress_value      = ["80", "443", "22", "3306", "8080", "1443", "1900"]
amis = {
  us-east-1 = "ami-04b4f1a9cf54c11d0"
  us-east-2 = "ami-0cb91c7de36eed2cb"
}
