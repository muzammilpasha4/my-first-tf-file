#Configuring VPC
resource "aws_vpc" "main" {
  cidr_block       = var.cidr
  instance_tenancy = "default"

  tags = {
    Name = "project-vpc"
  }
}

#Creating a Subnet
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone =   "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "main1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone =   "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet"
  }
}

#Creating Internet_Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "project-gw"
  }
}

#Creating Route_table
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  //route {
  //  cidr_block = "10.0.1.0/24"
  //  gateway_id = aws_internet_gateway.gw.id
  //}
  tags = {
    Name = "project-rt"
  }
}

#Creating Route_table_Association
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.example.id
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.main1.id
  route_table_id = aws_route_table.example.id
}
