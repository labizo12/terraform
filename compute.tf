#resource "google_compute_address" "static" {
#  name = "ip-server-website"
#}

resource "google_compute_instance" "server-aplikasi" {

  name                      = "server-aplikasi"
  machine_type              = "e2-small"
  zone                      = "asia-southeast2-a"
  tags                      = ["server-website", "server-aplikasi"]
  allow_stopping_for_update = true

  #deletion_protection       = false    (Optional)

  boot_disk {
  source = google_compute_disk.server-aplikasi-1.name
 }

 #attached_disk {
 # source = google_compute_disk.hardisk2.name
 #}

  network_interface {
    subnetwork = google_compute_subnetwork.vpc-project-rudi.id
    network    = "vpc-project-rudi"
    access_config { # untuk disable 

      #nat_ip = google_compute_address.static.address       #untuk static
      #nat_ip       = "true"
      #network_tier = "Premium"

    }
  }
 lifecycle {
  prevent_destroy = true
 }

  #metadata_startup_script = <<EOF
  #    apt-get update
  #    apt-get install apache2
  #    systemctl restart apache2
  #    systemctl start apache2
  #  
  #    EOF  

}




#resource "google_compute_instance" "default" {
#  name         = "attached-disk-instance"
#  machine_type = "e2-medium"
#  zone         = "us-west1-a"

#  boot_disk {
#    initialize_params {
#      image = "debian-cloud/debian-11"
#    }
#  }

#  network_interface {
#    network = "default"
#  }

#  lifecycle {
#    ignore_changes = [attached_disk]
#  }
#}


