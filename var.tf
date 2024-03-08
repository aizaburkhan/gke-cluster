variable project_name {
  type        = string
  default     = "project-group-hera-4"
}

variable project_name_display {
  type        = string
  default     = "Group Project 3"    
}

variable billing_account {
  type        = string
  default     = "014687-E3A505-12EFE8"    
}

variable bucket {
  type        = string
  default     = "project4-group-hera"    
}

variable region {
  type        = string
  default     = "us-central1"  
  }

variable vpc_name {
  type        = string
  default     = "project-vpc"  
}

variable subnet_name {
  type        = string
  default     = "private" 
}

variable subnet_cidr {
  type        = string
  default     = "10.0.0.0/16" 
}

variable secondary_ip_range1_name {
  type        = string
  default     = "k8-pod" 
}

variable secondary_ip_range1_cidr {
  type        = string
  default     = "10.1.0.0/20" 
}

variable secondary_ip_range2_name {
  type        = string
  default     = "k8-service" 
}

variable secondary_ip_range2_cidr {
  type        = string
  default     = "10.2.0.0/20" 
}

variable router_name {
  type        = string
  default     = "router-project" 
}

variable nat_name {
  type        = string
  default     = "my-router-nat" 
}

variable compute_address_nat_name {
  type        = string
  default     = "nat" 
}

variable cluster_name {
  type        = string
  default     = "group-project-3" 
}

variable node_pool_1_name {
  type        = string
  default     = "primary" 
}

variable node_pool_2_name {
  type        = string
  default     = "spot" 
}

variable instance_type {
  type        = string
  default     = "e2-small"    
}