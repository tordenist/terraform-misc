#PROVIDER CHECK

##AWS CREDS&REGION
provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "${var.instance_type}"
#    subnet_id = "${var.poc_subnet}"
#    security_group_id = "${var.poc_sg}"
    user_data = "${file("ubuntu-config.sh")}"
    tags {
        Name = "Vulnerable Ubuntu"
    }
}

resource "aws_instance" "windows" {
    ami = "${var.windows_ami}"
    instance_type = "${var.instance_type}"
#    subnet_id = "${var.poc_subnet}"
#    security_group_id = "${var.poc_sg}"
    user_data = "${file("windows-config.sh")}"
    tags {
        Name = "Vulnerable Windows"
    }
}

resource "aws_instance" "awslinux" {
    ami = "${var.awslinux_ami}"
    instance_type = "${var.instance_type}"
#    subnet_id = "${var.poc_subnet}"
#    security_group_id = "${var.poc_sg}"
    user_data = "${file("awslinux-config.sh")}"
    tags {
        Name = "Vulnerable AWSLinux"
    }
}