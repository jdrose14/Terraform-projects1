# Create an EC2 instance
resource "aws_instance" "control_node" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = "Nova-pemkp"

    tags = {
      Name = "ansible_control_node"
    }
}


resource "" "name" {
  
}



