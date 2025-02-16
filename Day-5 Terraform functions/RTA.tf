resource "aws_route_table_association" "public-subnets" {
  # count          = 3
  count          = length(var.Public_cidr_block)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "private-subnets" {
  # count          = 3
  count          = length(var.Private_cidr_block)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private-route-table.id
}
