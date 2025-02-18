# [START privateca_create_ca_pool]
resource "google_privateca_ca_pool" "default" {
  name = "ca-pool"
  location = "us-central1"
  tier = "ENTERPRISE"
  publishing_options {
    publish_ca_cert = true
    publish_crl = true
  }
  labels = {
    foo = "bar"
  }
}
# [END privateca_create_ca_pool]
