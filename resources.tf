resource "aws_vpc" "refresh_vpc" {
  cidr_block = "10.52.0.0/20"
}

resource "aws_subnet" "refresh_subnet" {
  cidr_block              = "10.52.1.0/24"
  vpc_id                  = aws_vpc.refresh_vpc.id
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "refresh_gw" {
  vpc_id = aws_vpc.refresh_vpc.id
}

resource "aws_route_table" "refresh_rt" {
  vpc_id = aws_vpc.refresh_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.refresh_gw.id
  }
}

resource "aws_route_table_association" "refresh_rt_ass" {
  route_table_id = aws_route_table.refresh_rt.id
  subnet_id      = aws_subnet.refresh_subnet.id
}

resource "aws_security_group" "refresh_secgp" {
  vpc_id = aws_vpc.refresh_vpc.id
}

resource "aws_security_group_rule" "refresh_secgp_1" {
  from_port         = 80
  protocol          = "TCP"
  security_group_id = aws_security_group.refresh_secgp.id
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "refresh_secgp_2" {
  from_port         = 22
  protocol          = "TCP"
  security_group_id = aws_security_group.refresh_secgp.id
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "refresh_secgp_3" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.refresh_secgp.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_instance" "refresh_instance" {
  ami             = var.image_id
  instance_type   = var.size
  subnet_id       = aws_subnet.refresh_subnet.id
  security_groups = [aws_security_group.refresh_secgp.id]
  user_data       = file("./configure.sh")
}






