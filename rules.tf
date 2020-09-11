locals {
  rules = {
    http-80-forward   = [80, "HTTP", "forward"]
    http-8080-forward = [8080, "HTTP", "forward"]

    http-80-redirect = [80, "HTTP", "redirect"]

    https-443-forward  = [443, "HTTPS", "forward"]
    https-8443-forward = [8443, "HTTPS", "forward"]
  }
}
