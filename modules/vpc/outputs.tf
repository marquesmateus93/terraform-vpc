output "my_vpc" {
    value = aws_vpc.marques_vpc
}

output "public_subnets" {
    value = [for s in data.aws_subnet.public_subnets : s.id]
}

output "private_subnets" {
    value = [for s in data.aws_subnet.private_subnets : s.id]
}

output "loab_balancer_security_groups" {
    value = aws_security_group.load_balancer.id
}