provider "aws" {
    region = "us-east-1"
}

resource "aws_security_group" "test_scg" {
    name = "allow ssh"
    description = "allow ssh from bastion host"
    ingress {
        description = "allow ssh from bastion host"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["10.13.127.156/32"]
    }
}

resource "aws_instance" "test_instance" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
    vpc_security_group_ids = [ aws_security_group.test_scg.id ]
}



/* 
referencing a specific parameter can be done by using the format resourcetype.localresourcename.parametername 
Its an example of implicit dependencies, where terraform will create the security group, and waiting for success initialization for resource1 in order to
start creating the Ec2 instance
*/