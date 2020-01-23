output "public_ip" {
  value = "Use this link to access the just built web page: http://"+aws_instance.refresh_instance.public_ip+"/index.html"
}