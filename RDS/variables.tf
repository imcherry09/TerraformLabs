variable "AWS_ACCESS_KEY" {
  type = string
  default ="AKIAWN6WCTLN664ID46Q"
}

variable "AWS_SECRET_KEY" {
  
}

variable "AWS_REGION" {
  type=string
  default="us-east-1"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "levelup_key.pub"
}


variable "PATH_TO_PRIVATE_KEY" {
    default = "levelup_key"
}

variable "AMIS" {
    type = map
    default = {

    }
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}