resource "aws_route_table" "marques_public_route_table" {
    vpc_id = aws_vpc.marques_vpc.id

    route {
        cidr_block = local.marques_public_route_table.cidr_block
        gateway_id = aws_internet_gateway.marques_internet_gateway.id
    }

    tags = merge({Name              = local.marques_public_route_table.name},
                 {internet_Gateway  = aws_internet_gateway.marques_internet_gateway.id},
                 var.tags)
}

resource "aws_route_table_association" "public_route_table" {
    count = length(aws_subnet.marques_public_subnet)

    subnet_id      = aws_subnet.marques_public_subnet[count.index].id
    route_table_id = aws_route_table.marques_public_route_table.id
}

resource "aws_route_table" "marques_private_route_table" {
    count = length(aws_nat_gateway.marques_nat_gateway)

    vpc_id = aws_vpc.marques_vpc.id

    route {
        cidr_block      = local.marques_private_route_table.cidr_block
        nat_gateway_id  = aws_nat_gateway.marques_nat_gateway[count.index].id
    }

    tags = merge({Name          = local.marques_private_route_table.name},
                 {nat_gateway   = aws_nat_gateway.marques_nat_gateway[count.index].id},
                  var.tags)
}

resource "aws_route_table_association" "private_route_table" {
    count = length(aws_route_table.marques_private_route_table)

    subnet_id      = aws_subnet.marques_private_subnet[count.index].id
    route_table_id = aws_route_table.marques_private_route_table[count.index].id
}