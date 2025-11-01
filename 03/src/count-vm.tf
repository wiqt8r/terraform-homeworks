resource "yandex_compute_instance" "web" {
  count       = var.vm_web_count
  name        = "web-${count.index + 1}"
  hostname    = "web-${count.index + 1}"
  platform_id = var.vm_web_platform_id
  zone        = var.default_zone

  resources {
    cores         = var.web_vm_resources.cores
    memory        = var.web_vm_resources.memory
    core_fraction = var.web_vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.web_vm_resources.disk_size
      type     = var.web_vm_resources.disk_type
    }
  }

  scheduling_policy {
    preemptible = var.web_vm_resources.preemptible
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop[var.default_zone].id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = local.vms_metadata
}

