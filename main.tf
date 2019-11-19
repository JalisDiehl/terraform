provider "aws" {
    region = "${var.region}"

}
resource "aws_instance" "web" {
  ami           = "${var.ami}"
  instance_type = "${var.type}"

  ipv4_addresses = "${var.ips}"
}
resource "aws_security_group" "allow_traffic" {
  name = "allow_traffic"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    ipv4_addresses = "${var.ips}"  
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    ipv4_addresses = "${var.ips}"
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "web_public_dns" {
  value = "${aws_instance.web.public_dns}"
}