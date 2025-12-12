data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  count         = 2
  key_name      = "key"

  tags = {
    Name = "dockersite-${count.index}"
  }
}

resource "local_file" "ansible_inventory" {
  filename = "./inventory"
  content  = join("\n", flatten([
    ["[project]"],
    [for i in aws_instance.example : "${i.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=/home/eissa/Downloads/key.pem"]
  ]))
  file_permission      = "0777"
  directory_permission = "0777"
}
