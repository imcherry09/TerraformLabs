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
  default = "C:/Users/tchar/.ssh/id_rsa_unlimitedKey.pub"
}


variable "PATH_TO_PRIVATE_KEY" {
    default = "C:/Users/tchar/.ssh/id_rsa_unlimitedKey"
}

variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-0f40c8f97004632f9"
        us-east-2 = "ami-05692172625678b4e"
        us-west-2 = "ami-0352d5a37fb4f603f"
        us-west-1 = "ami-0f40c8f97004632f9"
    }
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}