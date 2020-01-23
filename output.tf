output "public_ip" {
  value = "use this link to access the web page: http://${aws_instance.refresh_instance.public_ip}/index.html"
}