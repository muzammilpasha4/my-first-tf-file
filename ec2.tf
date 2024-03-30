resource "aws_instance" "web" {
    instance_type  = var.instance_type
    ami            = var.ami_id
    subnet_id      = aws_subnet.main.id
    associate_public_ip_address = true
    security_groups  = [aws_security_group.instance_sg.id]
    tags = {
    Name = "tf-instance"
  }
  }


