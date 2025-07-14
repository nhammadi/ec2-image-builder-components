resource "aws_security_group" "instance_sg" {
  name   = local.security_group_name
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.instance_sg.id

  description = "Allow HTTPS traffic"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
  cidr_ipv4   = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "all_traffic" {
  security_group_id = aws_security_group.instance_sg.id

  description = "Allow outbound internet traffic"
  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"
}
