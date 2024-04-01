variable "region"{
    default = "us-east-1"
    type = string
}

variable "cidr"{
    default =   "10.0.0.0/16"
}

variable "instance_type"{
    default = "t2.micro"
    type = string
}

variable "ami_id"{
    default = "ami-0c101f26f147fa7fd"
    type = string
}
