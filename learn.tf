
provider "aws"{
  profile = "default"
  region  = "us-west-2"

}


resource "aws_vpc" "mainfuhad" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "Gateway1" {
  vpc_id = aws_vpc.mainfuhad.id

  tags = { fuhad
    Name = "main"
  }
}


resource "aws_route_table" "example1" {
  vpc_id = aws_vpc.mainfuhad.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway..id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_internet_gateway..id
  }

  tags = {
    Name = "fuhad"
  }

  resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.mainfuhad.id
  cidr_block = "10.0.1.0/24"

  tags = {fuhad
    Name = "Main"


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.fuhad-1.id
  route_table_id = "aws_internet_gateway.Gateway.id
}




resource "aws_security_group" "security1" {
  name        = "security1"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.mainfuhad.id

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [192.168.56.1]
    
  }

ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [192.168.56.1]


ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [192.168.56.1]


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [192.168.56.1""]
  }

  tags = {
    Name = "allow_fuhad"
  }


resource "aws_network_interface" "testfuhad" {
  subnet_id       = aws_subnet.fuhad-1.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group" "security1.id]

  attachment {
    instance     = aws_instance.test.id
    device_index = 1
  }
}
}


  }
}
}




resource "aws_instance" "fuhad-server" {
    cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "fuhadvpc"
  }
    
  ami           = "ami-0ee8244746ec5d6d4"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"

  }
}


