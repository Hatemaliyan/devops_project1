provider "aws" {
  access_key = "<your access key>"
  secret_key = "<your secret access key>"
  region     = "eu-central-1"
}

resource "aws_key_pair" "new_key" {
  key_name   = "<key_pair_name>"
  public_key = "<content of your public key>"
}

resource "aws_instance" "first_instance" {
  ami           = "<AMI ID of the image you created with Packer>"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.new_key.key_name}"

  tags = {
    Name = "<name of the instance>"
  }
}
