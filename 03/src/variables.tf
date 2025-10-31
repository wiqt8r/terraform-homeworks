# сеть
variable "vpc_name" {
  type    = string
  default = "develop"
}

variable "default_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "default_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

#variable "folder_id" {
#  type = string
#}

#variable "cloud_id" {
#  type = string
#}

#variable "token" {
#  type = string
#}

# веб вм
variable "vm_web_platform_id" {
  type    = string
  default = "standard-v3"
}

variable "vm_web_image_family" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "vm_web_count" {
  type    = number
  default = 2
}

variable "web_vm_resources" {
  description = "Ресурсы для web ВМ"
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
    disk_size     = number
    disk_type     = string
    preemptible   = bool
  })
}

# вм базы данных
variable "vm_db_platform_id" {
  type    = string
  default = "standard-v3"
}

variable "vm_db_image_family" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "each_vm" {
  description = "Параметры ВМ баз данных"
  type = list(object({
    vm_name      = string
    zone         = string
    cores        = number
    memory       = number
    core_fraction= number
    disk_size    = number
    disk_type    = string
    preemptible  = bool
  }))
}

# подсети
variable "zones" {
  description = "Зоны и CIDR для подсетей"
  type = map(string)
}

# метадата
#variable "vms_metadata" {
#  description = "Метадата для ВМ"
#  type        = map(string)
#}

# метадата яндекса
variable "service_account_key_file" {
  description = "файл сервисного аккаунта"
  type        = string
}

variable "cloud_id" {
  description = "ИД облака ядекса"
  type        = string
}

variable "folder_id" {
  description = "ИД папкм в яндексе"
  type        = string
}

variable "vms_ssh_public_root_key" {
  description = "публичный ключ для доступа к ВМ"
  type        = string
}

