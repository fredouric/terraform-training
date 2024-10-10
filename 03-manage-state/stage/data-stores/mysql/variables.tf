variable "db_username" {
  description = "Username for the db"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "password for the db"
  type        = string
  sensitive   = true
}
