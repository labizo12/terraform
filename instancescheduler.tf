resource "google_compute_resource_policy" "job" {
  name        = "gcp-policy"
  region      = "asia-southeast2"
  description = "Start and stop instances"
  instance_schedule_policy {
    vm_start_schedule {
      schedule = "0 08 * * 1-5"                #kebutuhan
    }
    vm_stop_schedule {
      schedule = "0 22 * * 1-5"               #kebutuhan
    }
    time_zone = "Asia/Jakarta"
  }
}




#resource "google_compute_instance_iam_binding" "binding" {
#  project       = "rudi-project-382201"
#  zone          = "asia-southeast2-a"
#  instance_name = google_compute_instance.my-vm.name

#  role    = "roles/compute.admin"
#  members = ["serviceAccount:service-terraform@rudi-project-382201.iam.gserviceaccount.com"]




#  depends_on = [
#    google_compute_instance.my-vm
#  ]

#}







#resource "google_compute_resource_policy_attachment" "schedule" {
#  name     = google_compute_resource_policy.job.name
#  instance = google_compute_instance.my-vm.name
#  region   = "asia-southeast2"

#  depends_on = [
#    google_compute_instance.my-vm
#  ]

#}


