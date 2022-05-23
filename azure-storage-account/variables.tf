variable "location" {
  description = "lugar onde a conta será criada"
  type        = string
  default     = "West Europe"
}

variable "account_tier" {
  description = "Nível de acesso ao armazenamento"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Tipo de replicação da conta"
  type        = string
  default     = "LRS"
  sensitive   = true
}
