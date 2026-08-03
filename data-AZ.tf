
# data "aws_ec2_instance_type_offerings" "supported" {
#   filter {
#     name   = "instance-type"
#     values = [var.instancetype] # match whatever instance_type you're using
#   }
#   location_type = "availability-zone"
# }



