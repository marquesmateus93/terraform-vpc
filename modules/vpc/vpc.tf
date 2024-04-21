resource "aws_vpc" "marques_vpc" {
    cidr_block              = var.vpc_cidr_block

    enable_dns_support      = local.marques_vpc.enable_dns_support
    enable_dns_hostnames    = local.marques_vpc.enable_dns_hostnames

    tags = merge({Name = local.marques_vpc.name},
                {cidr_Block = var.vpc_cidr_block},
                var.tags)
}