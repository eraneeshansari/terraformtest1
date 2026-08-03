

resource "aws_security_group" "new_prod_sg" {
  name        = "new-prod-sg"
  description = "Production security group"

}


resource "aws_security_group_rule" "ing_Prod" {
  for_each          = var.prod_sg_rule
  type              = "ingress"
  security_group_id = aws_security_group.new_prod_sg.id
  from_port         = tonumber(each.key)
  to_port           = tonumber(each.key)
  protocol          = "tcp"
  cidr_blocks       = [each.value]
}


resource "aws_security_group_rule" "eg_Prod" {
  type              = "egress"
  security_group_id = aws_security_group.new_prod_sg.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
