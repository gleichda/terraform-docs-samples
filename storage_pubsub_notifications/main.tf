# [START storage_create_pubsub_notifications_tf]
// Create a Pub/Sub notification.
resource "google_storage_notification" "notification" {
  provider       = google-beta
  bucket         = google_storage_bucket.bucket.name
  payload_format = "JSON_API_V1"
  topic          = google_pubsub_topic.topic.id
  depends_on = [google_pubsub_topic_iam_binding.binding]
}

// Enable notifications by giving the correct IAM permission to the unique service account.
data "google_storage_project_service_account" "gcs_account" {
  provider = google-beta
}

// Create a Pub/Sub topic.
resource "google_pubsub_topic_iam_binding" "binding" {
  provider = google-beta
  topic    = google_pubsub_topic.topic.id
  role     = "roles/pubsub.publisher"
  members  = ["serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"]
}

resource "random_id" "bucket_prefix" {
  byte_length = 8
}

// Create a new storage bucket.
resource "google_storage_bucket" "bucket" {
  name     = "${random_id.bucket_prefix.hex}-example-bucket-name"
  provider = google-beta
  location = "US"
  uniform_bucket_level_access = true
}

resource "google_pubsub_topic" "topic" {
  name     = "your_topic_name"
  provider = google-beta
}
# [END storage_create_pubsub_notifications_tf]
