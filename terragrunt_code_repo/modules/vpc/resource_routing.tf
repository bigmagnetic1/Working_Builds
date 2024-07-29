# resource "aws_route_table" "route" {
#     vpc_id = data.aws_vpc.default_vpc.id
    
#     route {
#         cidr_block = "0.0.0.0/0"
#         gateway_id = data.aws_internet_gateway.default_gw.id
#     }
# }

# resource "aws_route_table_association" "public_route_associations" {
#     count          = length(aws_default_subnet.default_subnets)
#     subnet_id      = aws_default_subnet.default_subnets[count.index].id
#     route_table_id = aws_route_table.public_routes[count.index].id
# }

# resource "aws_route_table_association" "rt1" {
#     subnet_id = aws_default_subnet.default_public_subnet_1.id
#     route_table_id = aws_route_table.public_routes.id
# }

# resource "aws_route_table_association" "rt2" {
#     subnet_id = aws_default_subnet.default_public_subnet_2.id
#     route_table_id = aws_route_table.public_routes.id
# }

# resource "aws_route_table_association" "rt3" {
#     for_each = aws_default_subnet.default_public_subnet_3
#     subnet_id = each.value.id
#     route_table_id = aws_route_table.public_routes.id
# }

# resource "aws_route_table_association" "rt1" {
#     subnet_id      = aws_default_subnet.default_az1.id
#     route_table_id = aws_route_table.route.id
# }

# resource "aws_route_table_association" "rt2" {
#     subnet_id      = aws_default_subnet.default_az2.id
#     route_table_id = aws_route_table.route.id
# }

# resource "aws_route_table_association" "rt3" {
#     subnet_id      = aws_default_subnet.default_az3.id
#     route_table_id = aws_route_table.route.id
# }

# resource "aws_route_table_association" "rt4" {
#     subnet_id      = aws_default_subnet.default_az4.id
#     route_table_id = aws_route_table.route.id
# }