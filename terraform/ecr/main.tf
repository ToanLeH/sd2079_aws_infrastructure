module "ecr" {
  source      = "../modules/ecr"
  name        = "ecr"
  project     = "toanleh-devops"
  environment = "develop"
  owner       = "toanleh"
}
