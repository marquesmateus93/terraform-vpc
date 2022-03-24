locals {
    allow_http_https = [{
        port        = var.ports.http
        protocol    = "tcp"
        allowed_ips = var.all_ips
    },
    {
        port        = var.ports.https
        protocol    = "tcp"
        allowed_ips = var.all_ips
    }]
}