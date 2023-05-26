resource "aws_instance" "name" {
    ami = "ami-006dcf34c09e50022"
    instance_type = "t2.micro"

lifecycle {
    ignore_changes = [
      instance_type
    ]
  
}
  
}

