variable "aws_region" {
  description = "AWS region for deploying MediCare"
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "Ubuntu AMI ID in ap-south-1"
  type        = string
  default     = "ami-0c7632fb77f35db43"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "AWS EC2 Key Pair name for SSH"
  type        = string
  default     = "medicare-key"
}