# create shh key pair
resource "aws_key_pair" "tf-key" {
  key_name   = "tf-key"
  public_key = file("${path.module}/id_rsa.pub")
}

output "keyname" {
  value = aws_key_pair.tf-key.key_name
}
