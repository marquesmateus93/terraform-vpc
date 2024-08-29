locals {
  vpc = {
    name                  = "${var.prefix_name}"
    enable_dns_support    = true
    enable_dns_hostnames  = true
  }

  public_subnet = {
    name                    = "${var.prefix_name}-public-subnet"
    map_public_ip_on_launch = true
    kubernetesio_role_elb   = "1"
  }

  private_subnet = {
    name                            = "${var.prefix_name}-private-subnet"
    kubernetesio_role_internal_elb  = "1"
  }

  data_resource_subnet = {
    name  = "${var.prefix_name}-data-subnet"
  }

  public_route_table = {
    name        = "${var.prefix_name}-public-route-table"
    cidr_block  = "0.0.0.0/0"
  }

  private_route_table = {
    name        = "${var.prefix_name}-private-route-table"
    cidr_block  = "0.0.0.0/0"
  }

  nat_gateway = {
    name = "${var.prefix_name}-nat-gateway"
  }

  internet_gateway = {
    name = "${var.prefix_name}-internet-gateway"
  }

  elastic_ip = {
    name = "${var.prefix_name}-elastic-ip"
  }
}