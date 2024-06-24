resource "aws_vpc" "ntier_vpc" {
  cidr_block = var.vpc_network_cidr
  tags = {
    Name = local.name
  }
}

resource "aws_subnet" "subnets" {
  count      = length(var.subnet_cidr_ranges)
  vpc_id     = aws_vpc.ntier_vpc.id
  cidr_block = var.subnet_cidr_ranges[count.index]
  tags = {
    Name = var.subnet_name[count.index]
  }
}




