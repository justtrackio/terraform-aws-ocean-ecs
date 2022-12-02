variable "region" {
  type        = string
  description = "The region the cluster will run in"
  default     = null
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID"
  default     = null
}

variable "max_size" {
  type        = number
  description = "The upper limit of instances the cluster can scale up to"
  default     = null
}

variable "min_size" {
  type        = number
  description = "The lower limit of instances the cluster can scale down to"
  default     = 1
}

variable "subnet_ids" {
  type        = list(string)
  description = "A comma-separated list of subnet identifiers for the Ocean cluster. Subnet IDs should be configured with auto assign public ip"
  default     = []
}

variable "whitelist" {
  type        = list(string)
  description = "Instance types allowed in the Ocean cluster, Cannot be configured if blacklist is configured"
  default = [
    "c4.large",
    "c4.xlarge",
    "c4.2xlarge",
    "c4.4xlarge",
    "c5.large",
    "c5.xlarge",
    "c5.2xlarge",
    "c5.4xlarge",
    "c5a.large",
    "c5a.xlarge",
    "c5a.2xlarge",
    "c5a.4xlarge",
    "c5ad.large",
    "c5ad.xlarge",
    "c5ad.2xlarge",
    "c5ad.4xlarge",
    "c5d.large",
    "c5d.xlarge",
    "c5d.2xlarge",
    "c5d.4xlarge",
    "c5n.large",
    "c5n.xlarge",
    "c5n.2xlarge",
    "c5n.4xlarge",
    "g4dn.xlarge",
    "g4dn.2xlarge",
    "i3.large",
    "i3.xlarge",
    "i3en.large",
    "i3en.xlarge",
    "inf1.xlarge",
    "inf1.2xlarge",
    "m4.large",
    "m4.xlarge",
    "m4.2xlarge",
    "m5.large",
    "m5.xlarge",
    "m5.2xlarge",
    "m5a.large",
    "m5a.xlarge",
    "m5a.2xlarge",
    "m5ad.large",
    "m5ad.xlarge",
    "m5ad.2xlarge",
    "m5d.large",
    "m5d.xlarge",
    "m5d.2xlarge",
    "m5dn.large",
    "m5dn.xlarge",
    "m5dn.2xlarge",
    "m5n.large",
    "m5n.xlarge",
    "m5n.2xlarge",
    "r4.large",
    "r4.xlarge",
    "r5.large",
    "r5.xlarge",
    "r5a.large",
    "r5a.xlarge",
    "r5ad.large",
    "r5ad.xlarge",
    "r5b.large",
    "r5b.xlarge",
    "r5d.large",
    "r5d.xlarge",
    "r5dn.large",
    "r5dn.xlarge",
    "r5n.large",
    "r5n.xlarge",
    "z1d.large",
    "z1d.xlarge",
  ]
}

variable "key_pair" {
  type        = string
  description = "The key pair to attach the instances"
  default     = "ecs-temp"
}

variable "autoscaler_headroom_cpu_per_unit" {
  type        = number
  description = "Optionally configure the number of CPUs to allocate the headroom. CPUs are denoted in millicores, where 1000 millicores = 1 vCPU"
  default     = null
}

variable "autoscaler_headroom_memory_per_unit" {
  type        = number
  description = "Optionally configure the amount of memory (MB) to allocate the headroom"
  default     = null
}

variable "autoscaler_headroom_num_of_units" {
  type        = number
  description = "The number of units to retain as headroom, where each unit has the defined headroom CPU and memory"
  default     = null
}

variable "autoscaler_auto_headroom_percentage" {
  type        = number
  description = "The auto-headroom percentage. Set a number between 0-200 to control the headroom % of the cluster. Relevant when isAutoConfig=true"
  default     = 10
}
