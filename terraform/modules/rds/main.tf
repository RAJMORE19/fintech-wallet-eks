resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-${var.environment}-db-subnet"
  subnet_ids = var.private_subnet_ids
}

resource "aws_security_group" "rds" {
  name   = "${var.project_name}-${var.environment}-rds-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_rds_cluster" "main" {
  cluster_identifier   = "${var.project_name}-${var.environment}-aurora"
  engine               = "aurora-postgresql"
  database_name        = "walletdb"
  master_username      = var.db_username
  master_password      = var.db_password
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [
    aws_security_group.rds.id
  ]
  skip_final_snapshot = true
}

resource "aws_rds_cluster_instance" "main" {
  count              = 2
  identifier         = "${var.project_name}-${var.environment}-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.main.id
  engine             = aws_rds_cluster.main.engine
  instance_class     = "db.r6g.large"
}
