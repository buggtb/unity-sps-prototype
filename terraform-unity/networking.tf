resource "aws_vpc" "unity-test-env" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "unity-test-env"
  }
}

resource "aws_subnet" "subnet-uno" {
  cidr_block = cidrsubnet(aws_vpc.unity-test-env.cidr_block, 3, 1)
  vpc_id = aws_vpc.unity-test-env.id
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "subnet-two" {
  cidr_block = cidrsubnet(aws_vpc.unity-test-env.cidr_block, 4, 1)
  vpc_id = aws_vpc.unity-test-env.id
  availability_zone = "us-east-1b"
}

resource "aws_route_table" "route-table-test-env" {
  vpc_id = aws_vpc.unity-test-env.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-env-gw.id
  }
  tags = {
    Name = "test-env-route-table"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.subnet-uno.id
  route_table_id = aws_route_table.route-table-test-env.id
}

resource "aws_route_table_association" "subnet-association2" {
  subnet_id      = aws_subnet.subnet-two.id
  route_table_id = aws_route_table.route-table-test-env.id
}