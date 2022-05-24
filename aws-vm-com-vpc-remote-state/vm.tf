resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami                         = "ami-09d56f8956ab235b3"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.remote_state.outputs.subnet_ids
  vpc_security_group_ids      = [data.terraform_remote_state.remote_state.outputs.security_group_ids]
  associate_public_ip_address = true

  tags = {
    Name = "vm-terraform"
  }
}