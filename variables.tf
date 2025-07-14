variable "region" {
  type        = string
  description = "Default AWS region"
  default     = "eu-west-1"
}

variable "instance_type" {
  default     = "t2.micro"
  type        = string
  description = "Default instance type for EC2 image builder pipelines"
}

variable "iam_policy_arn" {
  type        = list(any)
  description = "List of Managed Policies common used by IAM role"
  default = [
    "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilder",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "subnet_id" {
  description = "VPC id"
  type        = string
}
