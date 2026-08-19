variable "sdn_rgs" {
  type = map(any)
}

variable "sdn_vnets" {
  type        = map(any)
  description = "sdn_vnets_fot Azure_infra"
}