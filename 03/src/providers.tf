terraform {
#  required_providers {
#    yandex = {
#      source = "yandex-cloud/yandex"
#    }
#  }
#  required_version = "~>1.12.0"
#}
  required_providers {
    yandex = { source = "yandex-cloud/yandex", version = "0.169.0" }
    local  = { source = "hashicorp/local",     version = "2.5.1" }
    random = { source = "hashicorp/random",    version = "3.6.3" }
    null   = { source = "hashicorp/null",      version = "3.2.2" }
  }
}

provider "yandex" {
  #token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
  # чтобы не спрашивал токен
  service_account_key_file = var.service_account_key_file
}
