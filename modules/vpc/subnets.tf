resource "aws_subnet" "marques_public_subnet" {
  count = length(var.azs)

  vpc_id            = aws_vpc.marques_vpc.id
  #cidr_block        = cidrsubnet(var.vpc_cidr_block, 8, (count.index + 1))
  cidr_block        = var.public_cidr_block[count.index]
  availability_zone = var.azs[count.index]

  tags = merge ({Name = "${var.prefix_name}-public-vpc"},
                {Cidr_Block = substr(var.public_cidr_block[count.index], -6, -3)},
                var.tags)
}

resource "aws_subnet" "marques_private_subnet" {
  count             = length(var.azs)

  vpc_id            = aws_vpc.marques_vpc.id
  #cidr_block        = cidrsubnet(var.vpc_cidr_block, 8, (count.index + 10))
  cidr_block        = var.private_cidr_block[count.index]
  availability_zone = var.azs[count.index]

  tags = merge ({Name = "${var.prefix_name}-private-vpc"},
    {Cidr_Block = substr(var.public_cidr_block[count.index], -7, -3)},
    var.tags)
}

resource "aws_subnet" "marques_database_subnet" {
  count = length(var.azs)

  vpc_id            = aws_vpc.marques_vpc.id
  #cidr_block        = cidrsubnet(local.vpc_cidr_block, 8, (count.index + 100))
  cidr_block        = var.database_cidr_block[count.index]
  availability_zone = var.azs[count.index]

  tags = merge ({Name = "${var.prefix_name}-database-vpc"},
    {Cidr_Block = substr(var.public_cidr_block[count.index], -8, -3)},
    var.tags)
}