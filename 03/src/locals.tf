locals {
  # формируем ключ
  ssh_pub_key = format("ubuntu:%s", trimspace(file(pathexpand("~/.ssh/yc_key.pub"))))

  # метадата для ВМ
  vms_metadata = {
    serial-port-enable = 1
    ssh-keys           = local.ssh_pub_key
  }
}

