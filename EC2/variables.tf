variable "aws_region" {
	description = "AWS region to launch servers."
	default     = "us-east-1"
}

variable "aws_access_key" {
	default = ""
}

variable "aws_secret_key" {
	default = ""
}

variable "key_name" {
	description = "Name of the SSH keypair to use in AWS."
}

variable "instance_type"{
	default = "t2.micro"
}

variable "ubuntu_ami"{
    default = "ami-9a6a128d"
}

variable "windows_ami"{
	default = "ami-a9906dc2"
}

variable "awslinux_ami"{
	default = "ami-0b33d91d"
}

