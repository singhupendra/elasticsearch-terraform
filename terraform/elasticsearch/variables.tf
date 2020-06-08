variable "dc_region" {
    default = "us-east-2"
}

variable "vpc_id"{
    default = ""
}

variable "cidr_block"{
    default = ""
}

variable "subnet_id" {
    default=""
}

variable "ami"{
    default=""
} 

variable "key"{
    default=""
}

variable "default-sg"{
    default=""
}

provider "aws" {
  region = var.dc_region
}
