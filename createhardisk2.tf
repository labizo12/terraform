resource "google_compute_disk" "server-aplikasi2" {
  name = "server-aplikasi-2"
  size = "50" #ubah size tidak destroy
  type = "pd-balanced"
  zone = "asia-southeast2-a"

  depends_on = [
    google_compute_instance.server-aplikasi
  ]
   
}
resource "google_compute_attached_disk" "hardisk2" {
  disk     = google_compute_disk.server-aplikasi2.id
  instance = google_compute_instance.server-aplikasi.id
}




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