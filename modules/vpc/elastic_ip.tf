resource "aws_eip" "marques_elastic_ip" {
  count   = length(var.public_cidr_block)

  domain  = "vpc"

  tags = merge({Name = local.marques_elastic_ip.name},
               {elastic_ip = count.index},
                var.tags)
}