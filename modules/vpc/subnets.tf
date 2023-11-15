resource "aws_subnet" "iaris_public_subnet" {
  count = length(var.azs)

  vpc_id                  = aws_vpc.iaris_vpc.id
  cidr_block              = var.public_cidr_block[count.index]
  map_public_ip_on_launch = local.iaris_public_subnet.map_public_ip_on_launch
  availability_zone       = var.azs[count.index]

  tags = merge ({Name                     = local.iaris_public_subnet.name},
                {"kubernetes.io/role/elb" = local.iaris_public_subnet.kubernetesio_role_elb},
                {cidr_Block               = substr(var.public_cidr_block[count.index], -6, -3)},
                var.tags)
}

resource "aws_subnet" "iaris_private_subnet" {
  count             = length(var.azs)

  vpc_id            = aws_vpc.iaris_vpc.id
  cidr_block        = var.private_cidr_block[count.index]
  availability_zone = var.azs[count.index]

  tags = merge ({Name                               = local.iaris_private_subnet.name},
                {"kubernetes.io/role/internal-elb"  = local.iaris_private_subnet.kubernetesio_role_internal-elb},
                {cidr_Block                         = substr(var.private_cidr_block[count.index], -7, -3)},
                var.tags)
}

resource "aws_subnet" "iaris_data_resource_subnet" {
  count = length(var.azs)

  vpc_id            = aws_vpc.iaris_vpc.id
  cidr_block        = var.data_resource_cidr_block[count.index]
  availability_zone = var.azs[count.index]

  tags = merge ({Name       = local.iaris_data_resource_subnet.name},
                {cidr_Block = substr(var.data_resource_cidr_block[count.index], -7, -3)},
                var.tags)
}