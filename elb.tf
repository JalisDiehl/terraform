module "elb_http"  {
  source  = "terraform-aws-modules/elb/aws"
  version = "~> 2.3"

  health_check = {"healthy_threshold": 2, 
                  "interval": 30, 
                  "target": "HTTP:80/", 
                  "timeout": 5, 
                  "unhealthy_threshold": 2}

  listener = [{"instance_port": "80", 
              "instance_protocol": "http", 
              "lb_port": "80", 
              "lb_protocol": "http"}]

  name = "model-lb"

  security_groups = [data.aws_security_group.default.id]

  subnets = data.aws_subnet_ids.all.ids
}