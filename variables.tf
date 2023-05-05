variable "vpc_id" {
  type        = string
  description = "The VPC ID"
  default     = null
}

variable "initial_vpc_id" {
  type        = string
  description = "The VPC ID used for service discovery namespace creation when you are not the owner if var.vpc_id. You can later on authorize the vpc to hosted zone association and tell the vpc owner to assign your hosted zone to the vpc."
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

variable "service_discovery_private_dns_name" {
  type        = string
  description = "The name of the namespace"
  default     = null
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
    "c6a.large",
    "c6i.large",
    "c6a.xlarge",
    "c6i.xlarge",
    "c6a.2xlarge",
    "c6i.2xlarge",
    "c6a.4xlarge",
    "c6i.4xlarge",
    "g4dn.xlarge",
    "g4dn.2xlarge",
    "i3.large",
    "i3.xlarge",
    "i3en.large",
    "i3en.xlarge",
    "i4i.large",
    "i4i.xlarge",
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
    "m6i.large",
    "m6i.xlarge",
    "m6i.2xlarge",
    "m6a.large",
    "m6a.xlarge",
    "m6a.2xlarge",
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
    "r6i.large",
    "r6i.xlarge",
    "r6a.large",
    "r6a.xlarge",
    "z1d.large",
    "z1d.xlarge",
  ]
}

variable "key_pair" {
  type        = string
  description = "The key pair to attach the instances"
  default     = "ecs"
}

variable "create_key_pair" {
  type        = string
  description = "Whether to create the key pair to attach the instances"
  default     = true
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

variable "ocean_image_id_ssm_parameter" {
  type        = string
  description = "SSM Parameter name which contains the AMI ID, defaults to official latest bottlerocket ami"
  default     = "/aws/service/bottlerocket/aws-ecs-1/x86_64/latest/image_id"
}

variable "ecs_allow_privileged_containers" {
  type        = bool
  description = "Whether or not to allow privileged containers, defaults to true"
  default     = true
}

variable "ecs_enable_spot_instance_draining" {
  type        = bool
  description = "Whether or not to enable spot instance draining, defaults to true"
  default     = true
}

variable "ocean_update_policy_should_roll" {
  default     = true
  type        = bool
  description = "Whether or not a change to the ocean should roll the cluster"
}

variable "metrics_send_metrics" {
  default     = false
  type        = bool
  description = "Whether or not send anonymous metrics"
}
