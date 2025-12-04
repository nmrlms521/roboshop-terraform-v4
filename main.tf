resource "aws_instance" "instances" {
  for_each      = var.components
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = each.key
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = self.private_ip
    }

    inline = [
      "sudo dnf install python3.13-pip -y",
      "sudo pip3.11 install ansible",
      "ansible-pull -i localhost, -U https://github.com/nmrlms521/roboshop-ansible-templates.git main.yml -e component=${each.key} -e env=dev"
    ]

  }

}

resource "aws_route53_record" "a-records" {
  for_each      = var.components
  zone_id = var.zone_id
  name    = "${each.key}-dev"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instances[each.key].private_ip]
}

