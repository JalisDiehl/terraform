provider "aws" {
  region = "us-east-1"

}

module "autoscaling" {
  source = "./autoscaling"
}

module "elb" {
  source = "./elb_1"
}
