resource "aws_security_group" "roboshop_sg" {
  name        = "${var.project_name}-${var.environment}-${var.sg_name}"
  description = var.sg_description
  vpc_id      = var.vpc_id

  # inclusion of rules when creating a security group by ingress and egress
  # creation of ingress rules is not mandatory while creation og sg
  # egress is always 0.0.0.0 0/0 because we dont restrict outgoing traffic ,
  # because its the traffic glowing out from the server
  # we can make egress static
  dynamic ingress { # ingress became dynamic ingress
      for_each = var.sg_ingress_rules #from variable
      content{
          description      = ingress.value["description"]
          from_port        = ingress.value["from_port"]
          to_port          = ingress.value["to_port"]
          protocol         = ingress.value["protocol"]
          cidr_blocks      = ingress.value["cidr_blocks"]        
      }
    }
    
  # egress is always 0.0.0.0 0/0 because we dont restrict outgoing traffic ,
  # because its the traffic glowing out from the server
  # we can make egress static
  
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }
    
    tags = merge(var.common_tags,
      var.sg_tags,
      {
        Name = "${var.project_name}-${var.environment}-${var.sg_name}"
      }
  )
}