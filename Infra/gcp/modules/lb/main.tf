resource "google_compute_backend_service" "backend" {
  name          = var.backend_service_name
  protocol      = "HTTP"
  port_name     = "http"
  health_checks = [var.backend_health_check]

  backend {
    group = var.backend_instance_group
  }
}

resource "google_compute_backend_service" "frontend" {
  name          = var.frontend_service_name
  protocol      = "HTTP"
  port_name     = "http"
  health_checks = [var.frontend_health_check]

  backend {
    group = var.frontend_instance_group
  }
}

resource "google_compute_url_map" "main" {
  name            = var.url_map_name
  default_service = google_compute_backend_service.frontend.id

  host_rule {
    hosts        = ["*"]
    path_matcher = "routes"
  }

  path_matcher {
    name            = "routes"
    default_service = google_compute_backend_service.frontend.id

    path_rule {
      paths   = ["/api/*"]
      service = google_compute_backend_service.backend.id
    }
  }
}

resource "google_compute_target_http_proxy" "proxy" {
  name    = var.proxy_name
  url_map = google_compute_url_map.main.id
}

resource "google_compute_global_forwarding_rule" "http" {
  name       = var.forwarding_rule_name
  target     = google_compute_target_http_proxy.proxy.id
  port_range = "80"
}