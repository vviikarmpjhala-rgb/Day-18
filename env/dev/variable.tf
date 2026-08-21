variable "sdn_rgs" {
  type = map(any)
}

variable "sdn_vnets" {
  type        = map(any)
  description = "sdn_vnets_fot Azure_infra"
}

variable "sdn_subnets" {
  type = map(any)
}
variable "sdn_pips" {
  type        = map(any)
  description = "public ip should three only"
}
variable "sdn_nsgs" {
  type = map(any)
  # use Dynamic block for the creating multiple nsgs security rules
}
variable "sdn_vm_nics" {
  type        = map(any)
  description = "variable of NIC and VM together"
}