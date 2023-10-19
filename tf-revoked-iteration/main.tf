provider "hcp" {}

provider "aws" {
  region = var.region
}

# data "hcp_packer_image" "ubuntu_us_east_2" {
data "hcp_packer_image" "ubuntu_ap_northeast_2" {
  bucket_name    = "learn-packer-ubuntu"
  cloud_provider = "aws"
  iteration_id   = var.iteration_id
  # region         = "us-east-2"
  region         = "ap-northeast-2"
}

resource "aws_instance" "app_server" {
  # ami           = data.hcp_packer_image.ubuntu_us_east_2.cloud_image_id
  ami           = data.hcp_packer_image.ubuntu_ap_northeast_2.cloud_image_id
  instance_type = "t2.micro"
  tags = {
    Name = "Learn-HCP-Packer"
  }
  
  lifecycle {
    precondition {
      condition = try(
        # formatdate("YYYYMMDDhhmmss", data.hcp_packer_image.ubuntu_us_east_2.revoke_at) > formatdate("YYYYMMDDhhmmss", timestamp()),
        # data.hcp_packer_image.ubuntu_us_east_2.revoke_at == null
        formatdate("YYYYMMDDhhmmss", data.hcp_packer_image.ubuntu_ap_northeast_2.revoke_at) > formatdate("YYYYMMDDhhmmss", timestamp()),
        data.hcp_packer_image.ubuntu_ap_northeast_2.revoke_at == null
      )
      error_message = "Source AMI is revoked."
    }
  }
}
