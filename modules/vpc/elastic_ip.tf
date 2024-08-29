resource "aws_eip" "elastic_ip" {
  count   = length(var.public_cidr_block)

  domain  = "vpc"

  tags = merge({Name = local.elastic_ip.name},
               {elastic_ip = count.index},
                var.tags)
}