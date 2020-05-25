module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 3.4"
  desired_capacity = "1"
  health_check_type = "EC2"
  image_id = data.aws_ami.amazon_linux.id
  instance_type = "m5.large"
  max_size = "4"
  min_size = "0"
  name = "major-lab"
  security_groups = [data.aws_security_group.default.id]
  vpc_zone_identifier = data.aws_subnet_ids.all.ids
}
