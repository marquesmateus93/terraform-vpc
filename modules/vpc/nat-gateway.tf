resource "aws_nat_gateway" "my_nat_gateway" {
  count = length(aws_subnet.marques_public_subnet)

  allocation_id = aws_eip.my_elastic_ip[count.index].id
  subnet_id     = aws_subnet.marques_public_subnet[count.index].id

  depends_on = [
    aws_internet_gateway.my_internet_gateway
  ]

  tags = merge({Name = "${var.prefix_name}-nat-gateway"},
               {Public_NAT_Gateway = count.index},
                var.tags)
}