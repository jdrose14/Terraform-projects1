# Create an EC2 instance
resource "aws_instance" "control_node" {
  ami             = var.ami_con
  instance_type   = var.instance_type
  key_name        = var.key_name
  vpc_security_group_ids = [aws_security_group.ansible_sg.id]
  user_data       = file("ansible_install.sh")

  tags = {
    Name = "ansible_control_node"
  }
}

resource "aws_instance" "target_nodes" {
  count         = 2
  ami           = var.ami_tar
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.ansible_sg.id]


  tags = {
    Name = "target_node${count.index}"
  }
}

resource "aws_security_group" "ansible_sg" {
  name = "ansible_sg"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = ports
    content {
      from_port   = ports.value
      to_port     = ports.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #this should be the source cidr block that's allowed access
    }

  }
}



