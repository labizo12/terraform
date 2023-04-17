resource "google_compute_network" "vpc-project-rudi" {
  name                    = "vpc-project-rudi"
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "vpc-project-rudi" {
  name          = "production"
  network       = google_compute_network.vpc-project-rudi.id
  region        = "asia-southeast2"
  ip_cidr_range = "10.10.200.0/24"
}


resource "google_compute_firewall" "website" {
  name          = "server-aplikasi-3"
  network       = "vpc-project-rudi"
  source_ranges = ["0.0.0.0/0"]
  source_tags   = ["server-website"]
  allow {
    protocol = "tcp"
    ports    = ["8080", "443", "22"]

  }

  depends_on = [
    google_compute_network.vpc-project-rudi
  ]

}



output "vpc-project-rudi" {
  value = google_compute_network.vpc-project-rudi.id

}

