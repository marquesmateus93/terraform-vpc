resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = merge({Name = local.internet_gateway.name},
               {vpc = aws_vpc.vpc.id},
                var.tags)
}