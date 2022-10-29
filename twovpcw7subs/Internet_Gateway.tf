
##########  INTERNET GATEWAY FOR VPC_1  ####################################################################

resource "aws_internet_gateway" "VPC_1_IGW" {
  vpc_id = aws_vpc.VPC_1.id

}


##########  INTERNET GATEWAY FOR VPC_2  ################################################################

resource "aws_internet_gateway" "VPC_2_IGW" {
  vpc_id = aws_vpc.VPC_2.id

}