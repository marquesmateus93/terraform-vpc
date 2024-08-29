resource "aws_vpc" "vpc" {
    cidr_block              = var.vpc_cidr_block

    enable_dns_support      = local.vpc.enable_dns_support
    enable_dns_hostnames    = local.vpc.enable_dns_hostnames

    tags = merge({Name = local.vpc.name},
                {cidr_Block = var.vpc_cidr_block},
                var.tags)
}