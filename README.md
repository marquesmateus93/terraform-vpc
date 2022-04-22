# Terraform VPC

## About:
The project contains a module that creates an AWS VPC structure to provide communication between three subnets layers: one public and two privates.

### - Public Subnets:
Allows communication from the internet providing access to private subnets. Bastion hosts could do the communication.

### - Private Subnets:
It is divided into two types: application and database.

#### Application Subnets:

The application machines don't have external access and should be access by SSH, just from public subnets. This access should be done just from Load Balancer in a specific port.

#### Database Subnets:

The database subnet was thought to be associated with an RDS instance and be accessed just from private subnets in a specific port.

## How To Deploy:

This module should be consumed by [Terragrunt VPC](https://github.com/Dev-Marques-Ops-Live-Infrastructure/terragrunt-vpc) Project.

## Structure:
<img src="https://user-images.githubusercontent.com/5325106/164470862-0a546613-65de-455e-b329-493755daab2a.png" width="600" height="700"/>

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.marques_elastic_ip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.marques_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.marques_nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.marques_private_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.marques_public_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.marques_database_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.marques_private_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.marques_public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.marques_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | Default cluster AZs. | `list(string)` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b"<br>]</pre> | no |
| <a name="input_database_cidr_block"></a> [database\_cidr\_block](#input\_database\_cidr\_block) | Database subnet IPs range. | `list(string)` | <pre>[<br>  "10.0.100.0/24",<br>  "10.0.200.0/24"<br>]</pre> | no |
| <a name="input_prefix_name"></a> [prefix\_name](#input\_prefix\_name) | Resources prefix name. | `string` | `""` | no |
| <a name="input_private_cidr_block"></a> [private\_cidr\_block](#input\_private\_cidr\_block) | Private subnet IPs range. | `list(string)` | <pre>[<br>  "10.0.10.0/24",<br>  "10.0.20.0/24"<br>]</pre> | no |
| <a name="input_public_cidr_block"></a> [public\_cidr\_block](#input\_public\_cidr\_block) | Public subnet IPs range. | `list(string)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tracking tags. | `map` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | VPC IPs range. | `string` | `"10.0.0.0/16"` | no |

## Outputs

No outputs.
