module "sd2079-host" {
  source = "../modules/ec2"
  name                          = "sd2079-host"

  ec2_instances                 = local.sd2079_hosts
  generate_ssh_key_pair         = true
  owner                         = var.owner
  project                       = var.project
  environment                   = var.environment
}