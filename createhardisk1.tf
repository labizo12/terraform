resource "google_compute_disk" "server-aplikasi-1" {
  name = "server-aplikasi"
  size = "110" #ubah size tidak destroy
  type = "pd-ssd"
  zone = "asia-southeast2-a"
  image = "ubuntu-os-cloud/ubuntu-1804-lts"

  lifecycle {
  prevent_destroy = true
 }
}
#resource "google_compute_attached_disk" "hardisk1" {
#  disk     = google_compute_disk.hardisk1.id
#  instance = google_compute_instance.my-vm.id
#}




#resource "google_compute_region_disk" "hardisk2" {
#  name                      = "hardisk2"
#  #snapshot                  = google_compute_snapshot.snapdisk.id
#  type                      = "pd-ssd"
#  region                    = "asia-southeast2"
#  physical_block_size_bytes = 4096

#  replica_zones = ["asia-southeast2-a", "asia-southeast2-b"]


#}


#resource "google_compute_snapshot" "snapdisk" {
#  name        = "my-snapshot"
#  source_disk = google_compute_disk.disk.name
#  zone        = "us-central1-a"
#}