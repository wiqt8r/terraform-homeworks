# параметры веб ВМ
web_vm_resources = {
  cores         = 2
  memory        = 1
  core_fraction = 20
  disk_size     = 5
  disk_type     = "network-hdd"
  preemptible   = true
}

# параметры БД ВМ
each_vm = [
  {
    vm_name      = "main"
    zone         = "ru-central1-b"
    cores        = 2
    memory       = 2
    core_fraction= 20
    disk_size    = 10
    disk_type    = "network-hdd"
    preemptible  = true
  },
  {
    vm_name      = "replica"
    zone         = "ru-central1-d"
    cores        = 2
    memory       = 1
    core_fraction= 20
    disk_size    = 5
    disk_type    = "network-hdd"
    preemptible  = true
  }
]

# метадата для всех вм
#vms_metadata = {
#  serial-port-enable = 1
#  ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIZYVUFS+7S0vn2F8z2++a3Vo5uJ9TrLFZdJZwB4oizh"
#}

# зоны и подсети
zones = {
  "ru-central1-a" = "10.0.1.0/24"
  "ru-central1-b" = "10.0.2.0/24"
  "ru-central1-d" = "10.0.3.0/24"
}

