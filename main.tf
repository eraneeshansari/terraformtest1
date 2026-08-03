
# locals {
#   supported_azs = data.aws_ec2_instance_type_offerings.supported.locations

# }

# output "supported_azs" {
#   value = local.supported_azs
# }

# resource "aws_instance" "kube_node" {
#   count                  = var.instance_count
#   ami                    = "ami-0b6d9d3d33ba97d99" #data.aws_ami.ubuntu.id
#   instance_type          = var.instancetype        # this instance is supported in all AZ in us-east-1 region , if any AZ dont support instance type u will error
#   key_name               = var.keyname
#   vpc_security_group_ids = [aws_security_group.new_prod_sg.id ] #add aws_security_group.web_sg.id
#   # availability_zone      = local.supported_azs[count.index % length(local.supported_azs)]
#   availability_zone = "us-east-1c"

#   tags = {
#     Name = "k8s-${count.index}"
#   }

# }