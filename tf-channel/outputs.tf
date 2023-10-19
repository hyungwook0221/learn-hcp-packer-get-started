output "ubuntu_iteration" {
  value = data.hcp_packer_iteration.ubuntu
}

# output "ubuntu_us_east_2" {
output "ubuntu_ap_northeast_2" {
  # value = data.hcp_packer_image.ubuntu_us_east_2
  value = data.hcp_packer_image.ubuntu_ap_northeast_2
}