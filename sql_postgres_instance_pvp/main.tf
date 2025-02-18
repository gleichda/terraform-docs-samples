# [START cloud_sql_postgres_instance_pvp]
resource "google_sql_database_instance" "postgres_pvp_instance_name" {
  name             = "postgres-pvp-instance-name"
  region           = "asia-northeast1"
  database_version = "POSTGRES_14"
  root_password = "abcABC123!"
  settings {
    tier              = "db-custom-2-7680"
    password_validation_policy {
      min_length  = 6
      reuse_interval = 2
      complexity  =  "COMPLEXITY_DEFAULT"
      disallow_username_substring = true
      password_change_interval = "30s"
      enable_password_policy = true
    }
  }
  deletion_protection = false # set to true to prevent destruction of the resource
}
# [END cloud_sql_postgres_instance_pvp]
