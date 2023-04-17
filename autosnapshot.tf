resource "google_compute_resource_policy" "auto-snapshot" {
  name   = "auto-snapshot"
  region = "asia-southeast2"
  snapshot_schedule_policy {
    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time    = "00:00"
        #schedule = 0 08 * * 1-5
        
        
      }
      
    }
  }
  depends_on = [
    google_compute_instance.server-aplikasi
  ]
}


resource "google_compute_disk_resource_policy_attachment" "peraturan" {
  name = google_compute_resource_policy.auto-snapshot.name
  disk = google_compute_disk.server-aplikasi-1.name
  zone = "asia-southeast2-a"

  depends_on = [
    google_compute_instance.server-aplikasi
  ]

}




#-------------------------------------------------
#resource "google_compute_disk" "hardisk" {
#  name  = google_compute_instance.my-vm.id
#  size  = 50
#  type  = "pd-ssd"
#  zone  = "asia-southeast2-a"


# depends_on = [
#    google_compute_instance.my-vm
#  ]

#}


#data "google_compute_image" "server-aplikasi" {
#  family  = "ubuntu-1804-lts"
#  project = "ubuntu-os-cloud"
#}
