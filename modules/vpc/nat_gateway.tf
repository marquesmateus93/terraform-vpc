resource "aws_nat_gateway" "nat_gateway" {
  count = length(aws_subnet.public_subnet)

  allocation_id = aws_eip.elastic_ip[count.index].id
  subnet_id     = aws_subnet.public_subnet[count.index].id

  depends_on = [
    aws_internet_gateway.internet_gateway
  ]

  tags = merge({Name                = local.nat_gateway.name},
               {public_nat_gateway  = count.index},
                var.tags)
}