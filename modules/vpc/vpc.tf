resource "aws_vpc" "marques_vpc" {
    cidr_block              = var.vpc_cidr_block

    enable_dns_support      = true
    enable_dns_hostnames    = true

    tags = merge({Name = "${var.prefix_name}-vpc"},
                 {Cidr_Block = var.vpc_cidr_block},
                  var.tags)
}