variable "AWS_ACCESS_KEY"{
    type=string
    default = "AKIAWN6WCTLN664ID46Q"
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default="us-east-2"
}

variable "Security_Group" {
  type = list
  default = ["sg-24076", "sg-90890", "sg-456789"]
}
