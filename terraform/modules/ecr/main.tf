module "ecr_tags" {
  source = "../tags"

  name        = var.name
  project     = var.project
  environment = var.environment
  owner       = var.owner

  tags = {
    Description = "managed by terraform",
  }
}

resource "aws_ecr_repository" "backend" {
  name                 = "${var.name}-${var.project}-backend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = var.enable_scan_on_push
  }

}

resource "aws_ecr_repository" "frontend" {
  name                 = "${var.name}-${var.project}-frontend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = var.enable_scan_on_push
  }

}
