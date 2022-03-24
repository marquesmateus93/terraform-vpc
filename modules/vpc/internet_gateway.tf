resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.marques_vpc.id

  tags = merge({Name = "${var.prefix_name}-internet-gateway"},
               {VPC = aws_vpc.marques_vpc.id},
                var.tags)
}