# Packer Nginx
locals {
  image_id = var.release != "" ? var.release : formatdate("YYYYMMDDhhmmss", timestamp())
}

source "googlecompute" "nginx" {
  project_id   = var.project_id
  source_image = "ubuntu-2004-focal-v20220404"
  ssh_username = "packer"
  zone         = "us-central1-a"

  image_name = replace("nginx-${local.image_id}", ".", "-")
}

build {
  sources = ["sources.googlecompute.nginx"]

  provisioner "ansible" {
    playbook_file          = "../ansible/playbook.yml"
    galaxy_file            = "../ansible/requirements.yml"
    galaxy_force_install   = true
    galaxy_force_with_deps = true
    user                   = "packer"
    ansible_ssh_extra_args = ["-oPubkeyAcceptedKeyTypes=+ssh-rsa", " -oHostKeyAlgorithms=+ssh-rsa"]
  }
}
