# Packer Nginx

source "googlecompute" "nginx" {
  project_id   = var.project_id
  source_image = "ubuntu-2004-focal-v20220404"
  ssh_username = "packer"
  zone         = "us-central1-a"
}

build {
  sources = ["sources.googlecompute.nginx"]

  provisioner "ansible" {
    playbook_file          = "../ansible/playbook.yml"
    galaxy_file            = "../ansible/requirements.yml"
    user                   = "packer"
    ansible_ssh_extra_args = ["-oPubkeyAcceptedKeyTypes=+ssh-rsa", " -oHostKeyAlgorithms=+ssh-rsa"]
  }
}
