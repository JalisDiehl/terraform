module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 3.4" 
  # The number of Amazon EC2 instances that should be running in the group
  # type: string
  desired_capacity = "1"

  # Controls how health checking is done. Values are - EC2 and ELB
  # type: string
  health_check_type = "EC2"

  # The EC2 image ID to launch
  # type: string
  image_id = module.datinha.data.aws_ami.amazon_linux.id

  # The size of instance to launch
  # type: string
  instance_type = "m4.large"

  # The maximum size of the auto scale group
  # type: string
  max_size = "4"

  # The minimum size of the auto scale group
  # type: string
  min_size = "0"

  # Creates a unique name beginning with the specified prefix
  # type: string
  name = "major-lab"

  # A list of security group IDs to assign to the launch configuration
  # type: list(string)
  security_groups = [module.datinha.data.aws_security_group.default.id]

  # A list of subnet IDs to launch resources in
  # type: list(string)
  vpc_zone_identifier = module.datinha.data.aws_subnet_ids.all.ids

  
}