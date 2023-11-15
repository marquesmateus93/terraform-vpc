resource "aws_eip" "iaris_elastic_ip" {
  count   = length(var.public_cidr_block)

  domain  = "vpc"

  tags = merge({Name = local.iaris_elastic_ip.name},
               {elastic_ip = count.index},
                var.tags)
}