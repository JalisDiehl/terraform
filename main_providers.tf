provider "aws" {
  region = "us-east-1"

}
module "data1" {
  source = "./aws-data"
}
module "autoscaling" {
  source = "./autoscaling"
}

module "elb" {
  source = "./elb_1"
}
