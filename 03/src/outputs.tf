output "vms_list" {
  description = "Все ВМ из count и for_each"
  value = concat(
    [
      for vm in yandex_compute_instance.web :
      {
        name = vm.name
        id   = vm.id
        fqdn = vm.fqdn
      }
    ],
    [
      for vm in values(yandex_compute_instance.db) :
      {
        name = vm.name
        id   = vm.id
        fqdn = vm.fqdn
      }
    ]
  )
}

