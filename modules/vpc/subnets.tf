resource "aws_subnet" "public_subnet" {
  count = length(var.azs)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_cidr_block[count.index]
  map_public_ip_on_launch = local.public_subnet.map_public_ip_on_launch
  availability_zone       = var.azs[count.index]

  tags = merge ({Name                     = local.public_subnet.name},
                {"kubernetes.io/role/elb" = local.public_subnet.kubernetesio_role_elb},
                {cidr_Block               = substr(var.public_cidr_block[count.index], -6, -3)},
                var.tags)
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.azs)

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_cidr_block[count.index]
  availability_zone = var.azs[count.index]

  tags = merge ({Name                               = local.private_subnet.name},
                {"kubernetes.io/role/internal-elb"  = local.private_subnet.kubernetesio_role_internal_elb},
                {cidr_Block                         = substr(var.private_cidr_block[count.index], -7, -3)},
                var.tags)
}

resource "aws_subnet" "data_resource_subnet" {
  count = length(var.azs)

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.resources_cidr_block[count.index]
  availability_zone = var.azs[count.index]

  tags = merge ({Name       = local.data_resource_subnet.name},
                {cidr_Block = substr(var.resources_cidr_block[count.index], -7, -3)},
                var.tags)
}