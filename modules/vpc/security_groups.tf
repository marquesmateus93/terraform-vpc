resource "aws_security_group" "ssh_bastion" {
  name        = "ssh_bastion"
  description = "Allow SSH inbound to bastion."
  vpc_id      = aws_vpc.marques_vpc.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = merge({Name = "${var.prefix_name}-ssh-bastion"},
                var.tags)
}

resource "aws_security_group" "load_balancer" {
  name        = "allow_http_https"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.marques_vpc.id

  dynamic "ingress" {
    for_each = local.allow_ssh_http_https

    content{
      from_port        = ingress.value.port
      to_port          = ingress.value.port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.allowed_ips
    } 
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = merge({Name = "${var.prefix_name}-ssh-http-https"},
                var.tags)
}