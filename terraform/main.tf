# main.tf

resource "aws_instance" "servers" {
  count         = length(var.server_names)
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name        = "${var.server_names[count.index]}-server-${count.index + 1}"
    Environment = "dev"
  }

#   provisioner "remote-exec" {
#     inline = [
#       # Replace with the content of your SonarQube installation script
#       "echo 'SonarQube installation script content' > install_sonarqube.sh",
#       "chmod +x install_sonarqube.sh",
#       "./install_sonarqube.sh",
#     ]

#     connection {
#       type        = "ssh"
#       user        = "ec2-user"  # Change to your SSH user
#       private_key = file("${path.module}/phpserver.pem")  # Change to your private key path
#       host        = self.public_ip
#     }
#   }

#   provisioner "remote-exec" {
#     inline = [
#       # Replace with the content of your Nexus installation script
#       "echo 'Nexus installation script content' > install_nexus.sh",
#       "chmod +x install_nexus.sh",
#       "./install_nexus.sh",
#     ]

#     connection {
#       type        = "ssh"
#       user        = "ec2-user"  # Change to your SSH user
#       private_key = file("${path.module}/phpserver.pem")  # Change to your private key path
#       host        = self.public_ip
#     }
#   }

  # Reference the security group IDs for SSH, HTTP, and HTTPS
  # vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_http.id, aws_security_group.allow_https.id]
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow incoming SSH traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow incoming HTTP traffic"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_https" {
  name        = "allow_https"
  description = "Allow incoming HTTPS traffic"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
