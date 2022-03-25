#data "aws_subnet" "public_subnets" {
#    count   = length(aws_subnet.marques_public_subnet)
#    id      = aws_subnet.marques_public_subnet[count.index].id
#}
#
#data "aws_subnet" "private_subnets" {
#    count   = length(aws_subnet.marques_private_subnet)
#    id      = aws_subnet.marques_private_subnet[count.index].id
#}