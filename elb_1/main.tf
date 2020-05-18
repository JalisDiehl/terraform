terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-elb.git?ref=v2.3.0"
}

inputs = {
  # A health check block
  # type: map(string)
  health_check = {"healthy_threshold": 2, 
                  "interval": 30, 
                  "target": "HTTP:80/", 
                  "timeout": 5, 
                  "unhealthy_threshold": 2}

  listener = [{"instance_port": "80", 
              "instance_protocol": "http", 
              "lb_port": "80", 
              "lb_protocol": "http"}]

  # The name of the ELB
  # type: string
  name = "Entrance-lb"

  # A list of security group IDs to assign to the ELB
  # type: list(string)
  security_groups = []

  # A list of subnet IDs to attach to the ELB
  # type: list(string)
  subnets = []