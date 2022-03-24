variable "prefix_name" {
  description = "Resources prefix name."
  type        = string
  default     = ""
}

variable "all_ips" {
  description = "Full IPs range."
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "vpc_cidr_block" {
  description = "VPC IPs range."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_cidr_block" {
  description = "Public subnet IPs range."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_cidr_block" {
  description = "Private subnet IPs range."
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.20.0/24"]
}

variable "database_cidr_block" {
  description = "Database subnet IPs range."
  type        = list(string)
  default     = ["10.0.100.0/24", "10.0.200.0/24"]
}

variable "azs" {
  description = "Default cluster AZs."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "ports" {
  description = "Default ports map."
  type        = map
  default = {
    http    = 80
    https   = 443
    ssh     = 22
  }
}

variable "tags" {
  description = "Tracking tags."
  type        = map
}