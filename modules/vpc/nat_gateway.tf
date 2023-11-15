resource "aws_nat_gateway" "iaris_nat_gateway" {
  count = length(aws_subnet.iaris_public_subnet)

  allocation_id = aws_eip.iaris_elastic_ip[count.index].id
  subnet_id     = aws_subnet.iaris_public_subnet[count.index].id

  depends_on = [
    aws_internet_gateway.iaris_internet_gateway
  ]

  tags = merge({Name                = local.iaris_nat_gateway.name},
               {public_nat_gateway  = count.index},
                var.tags)
}