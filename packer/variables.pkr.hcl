variable "project_id" {
  type        = string
  description = "ID do projeto do google cloud"
}

variable "release" {
  type        = string
  description = "Tag de release da pipeline de CI"
  default     = ""
}
