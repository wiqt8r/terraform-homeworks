# образ убунту
data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}

# сеть
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

# подсетки по зонам
resource "yandex_vpc_subnet" "develop" {
  for_each       = var.zones
  name           = "subnet-${each.key}"
  zone           = each.key
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [each.value]
}
