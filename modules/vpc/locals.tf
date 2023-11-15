locals {
  iaris_vpc = {
    name                  = "${var.prefix_name}-vpc"
    enable_dns_support    = true
    enable_dns_hostnames  = true
  }

  iaris_public_subnet = {
    name                    = "${var.prefix_name}-public-subnet"
    map_public_ip_on_launch = true
    kubernetesio_role_elb   = "1"
  }

  iaris_private_subnet = {
    name                            = "${var.prefix_name}-private-subnet"
    kubernetesio_role_internal-elb  = "1"
  }

  iaris_data_resource_subnet = {
    name                            = "${var.prefix_name}-data-subnet"
  }

  iaris_public_route_table = {
    name        = "${var.prefix_name}-public-route-table"
    cidr_block  = "0.0.0.0/0"
  }

  iaris_private_route_table = {
    name        = "${var.prefix_name}-private-route-table"
    cidr_block  = "0.0.0.0/0"
  }

  iaris_nat_gateway = {
    name = "${var.prefix_name}-nat-gateway"
  }

  iaris_internet_gateway = {
    name = "${var.prefix_name}-internet-gateway"
  }

  iaris_elastic_ip = {
    name = "${var.prefix_name}-elastic-ip"
  }
}