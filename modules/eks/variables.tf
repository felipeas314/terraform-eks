variable "cluster_name" {
  type = string
  description = "Name of the EKS cluster"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version to use for the EKS cluster"
  default     = "1.25"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where the EKS cluster will be created"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets for EKS (usually private subnets for node groups)"
}

variable "control_plane_subnet_ids" {
  type        = list(string)
  description = "Subnets specifically for the EKS control plane"
  default     = []
}

variable "cluster_endpoint_public_access" {
  type        = bool
  description = "Whether the EKS endpoint is publicly accessible"
  default     = true
}

variable "manage_aws_auth_configmap" {
  type        = bool
  description = "Whether to manage the aws-auth configmap"
  default     = true
}

variable "cluster_addons" {
  type        = map(any)
  description = "Map of cluster addons to manage"
  default     = {}
}

variable "eks_managed_node_groups" {
  type        = map(any)
  description = "Map of EKS Managed Node Groups"
  default     = {}
}

variable "self_managed_node_groups" {
  type        = map(any)
  description = "Map of Self-Managed (EC2) Node Groups"
  default     = {}
}

variable "fargate_profiles" {
  type        = map(any)
  description = "Map of Fargate Profiles"
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to all resources"
  default     = {}
}
