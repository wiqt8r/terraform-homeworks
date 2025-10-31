# три дополнительных диска через count
resource "yandex_compute_disk" "extra_disks" {
  count = length(var.storage_disks)
  name  = var.storage_disks[count.index].name
  zone  = var.storage_vm.zone
  size  = var.storage_disks[count.index].size
  type  = var.storage_disks[count.index].type
}

# одиночная ВМ storage
resource "yandex_compute_instance" "storage" {
  name        = var.storage_vm.name
  platform_id = var.storage_vm.platform_id
  zone        = var.storage_vm.zone

  resources {
    cores         = var.storage_vm.cores
    memory        = var.storage_vm.memory
    core_fraction = var.storage_vm.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.storage_vm.boot_disk_size
      type     = var.storage_vm.boot_disk_type
    }
  }

  # подключаем три диска
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.extra_disks
    content {
      disk_id     = secondary_disk.value.id
      device_name = secondary_disk.value.name
    }
  }

network_interface {
  subnet_id          = yandex_vpc_subnet.develop[var.storage_vm.zone].id
  nat                = true
  security_group_ids = [yandex_vpc_security_group.example.id]
}


  metadata = local.vms_metadata

  scheduling_policy {
    preemptible = var.storage_vm.preemptible
  }
}

