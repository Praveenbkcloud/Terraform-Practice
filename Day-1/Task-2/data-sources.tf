data "aws_vpc" "data-source" {
  id = "vpc-0333441cb51656ffa"
}

resource "aws_internet_gateway" "Data-source-IGW" {
  vpc_id = data.aws_vpc.data-source.id

  tags = {
    Name = "Data-source-IGW"
  }
}
