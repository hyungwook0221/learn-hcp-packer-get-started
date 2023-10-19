output "image_revocation_date" {
  # value = data.hcp_packer_image.ubuntu_us_east_2.revoke_at
  value = data.hcp_packer_image.ubuntu_ap_northeast_2.revoke_at
}