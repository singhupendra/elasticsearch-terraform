provider "aws" {
  region = var.region
}
resource "aws_instance" "instance"{
    ami           = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = var.vpc_security_group_ids
    subnet_id     = var.subnet_id
    key_name      = var.key_name
    root_block_device {
      volume_type = "gp2"
      volume_size = "15"
    }
    
   provisioner "local-exec" {
     command = "sleep 30 && ansible-playbook -u ec2-user  -i ${aws_instance.instance.public_dns}, ../../ansible/playbook.yaml"
    }
    tags = {
        Name = var.name
        environment = var.environment
    }
    
}