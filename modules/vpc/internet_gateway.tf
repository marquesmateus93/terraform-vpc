resource "aws_internet_gateway" "iaris_internet_gateway" {
  vpc_id = aws_vpc.iaris_vpc.id

  tags = merge({Name = local.iaris_internet_gateway.name},
               {vpc = aws_vpc.iaris_vpc.id},
                var.tags)
}