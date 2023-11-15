resource "aws_vpc" "iaris_vpc" {
    cidr_block              = var.vpc_cidr_block

    enable_dns_support      = local.iaris_vpc.enable_dns_support
    enable_dns_hostnames    = local.iaris_vpc.enable_dns_hostnames

    tags = merge({Name = local.iaris_vpc.name},
                {cidr_Block = var.vpc_cidr_block},
                var.tags)
}