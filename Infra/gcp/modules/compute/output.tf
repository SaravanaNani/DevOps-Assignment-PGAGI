output "backend_instance_group" {
  value = google_compute_instance_group_manager.backend.instance_group
}

output "frontend_instance_group" {
  value = google_compute_instance_group_manager.frontend.instance_group
}

output "backend_health_check" {
  value = google_compute_health_check.backend.id
}

output "frontend_health_check" {
  value = google_compute_health_check.frontend.id
}