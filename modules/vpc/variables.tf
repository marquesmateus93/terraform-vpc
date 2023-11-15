variable "prefix_name" {
  description = "Resources prefix name."
  type        = string
  validation {
    condition = can(
      regex(
        "[a-z-]",
        var.prefix_name
      )
    )
    error_message = "Just uppercase and hifen are allowed."
  }
}

variable "vpc_cidr_block" {
  description = "VPC IPs range."
  type        = string
  default     = "10.0.0.0/16"
  validation {
    condition = can(
      cidrnetmask(var.vpc_cidr_block)
    )
    error_message = "Provide a valid IP pattern: IP/Mask."
  }
}

variable "public_cidr_block" {
  description = "Public subnet IPs range."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  validation {
    condition = alltrue([
      for cidr in var.public_cidr_block : can(cidrnetmask(cidr))
    ])
    error_message = "Provide a list string of valid pattern: IPs/Mask."
  }
}

variable "private_cidr_block" {
  description = "Private subnet IPs range."
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
  validation {
    condition = alltrue([
      for cidr in var.private_cidr_block : can(cidrnetmask(cidr))
    ])
    error_message = "Provide a list string of valid pattern: IPs/Mask."
  }
}

variable "data_resource_cidr_block" {
  description = "Data resources subnet IPs range."
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24", "10.0.33.0/24"]
  validation {
    condition = alltrue([
      for cidr in var.data_resource_cidr_block : can(cidrnetmask(cidr))
    ])
    error_message = "Provide a list string of valid pattern: IPs/Mask."
  }
}

variable "azs" {
  description = "Default AZs range. Ohio."
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
  validation {
    condition = alltrue([
      for cidr in var.azs : can(regex("(us(-gov)?|ap|ca|cn|eu|sa)-(central|(north|south)?(east|west)?)-\\d+[a-e]{1}",
          cidr))
    ])
    error_message = "Provide a string list of valid example pattern: 'us-east-2a'."
  }
}

variable "tags" {
  description = "Tracking tags."
  type        = map(string)
  validation {
    condition = alltrue ([
      for tag in keys(var.tags) : contains(["environment", "creator_id", "powered_by"],
          tag)
    ])
    error_message = "Tags must contain at least: 'environment', 'creator_id' and 'powered_by'."
  }
}