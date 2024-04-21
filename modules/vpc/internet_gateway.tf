resource "aws_internet_gateway" "marques_internet_gateway" {
  vpc_id = aws_vpc.marques_vpc.id

  tags = merge({Name = local.marques_internet_gateway.name},
               {vpc = aws_vpc.marques_vpc.id},
                var.tags)
}