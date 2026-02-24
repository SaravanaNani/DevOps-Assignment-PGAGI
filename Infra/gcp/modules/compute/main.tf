resource "google_compute_instance_template" "backend" {
  name_prefix  = "${var.project_name}-${var.environment}-backend"
  machine_type = var.backend_machine_type

  lifecycle {
    create_before_destroy = true
  }

  disk {
    boot         = true
    auto_delete  = true
    source_image = "projects/debian-cloud/global/images/family/debian-12"
  }

  network_interface {
    network    = var.vpc_id
    subnetwork = var.subnet_id
  }

  metadata_startup_script = file("${path.module}/backend-startup.sh")

}

resource "google_compute_instance_template" "frontend" {
  name_prefix  = "${var.project_name}-${var.environment}-frontend"
  machine_type = var.frontend_machine_type

  lifecycle {
    create_before_destroy = true
  }

  disk {
    boot         = true
    auto_delete  = true
    source_image = "projects/debian-cloud/global/images/family/debian-12"
  }

  network_interface {
    network    = var.vpc_id
    subnetwork = var.subnet_id
  }
  metadata_startup_script = file("${path.module}/frontend-startup.sh")
}

resource "google_compute_instance_group_manager" "backend" {
  name               = "${var.project_name}-${var.environment}-backend-mig"
  base_instance_name = "backend"
  zone               = var.zone
  target_size        = var.backend_min_replicas

  version {
    instance_template = google_compute_instance_template.backend.id
  }

  named_port {
    name = "http"
    port = 8000
  }
}

resource "google_compute_instance_group_manager" "frontend" {
  name               = "${var.project_name}-${var.environment}-frontend-mig"
  base_instance_name = "frontend"
  zone               = var.zone
  target_size        = var.frontend_min_replicas

  version {
    instance_template = google_compute_instance_template.frontend.id
  }

  named_port {
    name = "http"
    port = 3000
  }
}

resource "google_compute_autoscaler" "backend" {
  name   = "${var.project_name}-${var.environment}-backend-autoscaler"
  zone   = var.zone
  target = google_compute_instance_group_manager.backend.id

  autoscaling_policy {
    min_replicas = var.backend_min_replicas
    max_replicas = var.backend_max_replicas

    cpu_utilization {
      target = 0.6
    }
  }
}

resource "google_compute_autoscaler" "frontend" {
  name   = "${var.project_name}-${var.environment}-frontend-autoscaler"
  zone   = var.zone
  target = google_compute_instance_group_manager.frontend.id

  autoscaling_policy {
    min_replicas = var.frontend_min_replicas
    max_replicas = var.frontend_max_replicas

    cpu_utilization {
      target = 0.6
    }
  }
}

resource "google_compute_health_check" "backend" {
  name = "${var.project_name}-${var.environment}-backend-hc"

  http_health_check {
    port         = 8000
    request_path = "/api/health"
  }
}

resource "google_compute_health_check" "frontend" {
  name = "${var.project_name}-${var.environment}-frontend-hc"

  http_health_check {
    port         = 3000
    request_path = "/"
  }
}