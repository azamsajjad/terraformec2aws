# creating Security Group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow tls inbound traffic"

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description      = "tls"
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "allow_ssh"
  }
}
output "securityGroupDetails" {
  value = aws_security_group.allow_tls.id
}