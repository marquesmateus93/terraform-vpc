resource "aws_route_table" "marques_public_route_table" {
    vpc_id = aws_vpc.marques_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_internet_gateway.id
    }

    tags = merge({Name = "${var.prefix_name}-public-route-table"},
                 {Internet_Gateway = aws_internet_gateway.my_internet_gateway.id},
                 var.tags)
}

resource "aws_route_table_association" "public_route_table" {
    count = length(aws_subnet.marques_public_subnet)

    subnet_id      = aws_subnet.marques_public_subnet[count.index].id
    route_table_id = aws_route_table.marques_public_route_table.id
}

resource "aws_route_table" "my_private_route_table" {
    count = length(aws_nat_gateway.my_nat_gateway)

    vpc_id = aws_vpc.marques_vpc.id

    route {
        cidr_block      = "0.0.0.0/0"
        nat_gateway_id  = aws_nat_gateway.my_nat_gateway[count.index].id
    }

    tags = merge({Name = "${var.prefix_name}-private-route-table"},
                 {NAT_Gateway = aws_nat_gateway.my_nat_gateway[count.index].id},
                  var.tags)
}

resource "aws_route_table_association" "private_route_table" {
    count = length(aws_route_table.my_private_route_table)

    subnet_id      = aws_subnet.marques_private_subnet[count.index].id
    route_table_id = aws_route_table.my_private_route_table[count.index].id
}