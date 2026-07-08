resource "aws_subnet" "public" {
  count = 2

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name    = "${var.project_name}-public-${count.index + 1}"
    Project = var.project_name
    Tier    = "public"
  }
}

resource "aws_subnet" "private_app" {
  count = 2

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_app_subnet_cidrs[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name    = "${var.project_name}-private-app-${count.index + 1}"
    Project = var.project_name
    Tier    = "private-app"
  }
}

resource "aws_subnet" "isolated_db" {
  count = 2

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.isolated_db_subnet_cidrs[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name    = "${var.project_name}-isolated-db-${count.index + 1}"
    Project = var.project_name
    Tier    = "isolated-db"
  }
}
