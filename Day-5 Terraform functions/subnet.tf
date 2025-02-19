resource "aws_subnet" "public_subnet" {
  #count             = 3 #012
  count             = length(var.Public_cidr_block)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.Public_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.vpc_name}-public-subnet${count.index + 1}"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "private_subnet" {
  #count             = 3 #012
  count             = length(var.Private_cidr_block)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.Private_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.vpc_name}-private-subnet${count.index + 1}"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = "${var.environment}"
  }
}


