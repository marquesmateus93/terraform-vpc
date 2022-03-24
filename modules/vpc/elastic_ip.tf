resource "aws_eip" "my_elastic_ip" {
  count   = length(var.public_cidr_block)

  vpc     = true

  tags = merge({Name = "${var.prefix_name}-elastic-ip"},
               {Elastic_IP = count.index},
                var.tags)
}