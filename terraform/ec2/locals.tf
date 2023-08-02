locals {
  sd2079_hosts = {
    sd2079_host_1 = {
        name = "sd2079-host"
        ami                           = "ami-0b13630a979679b27"
        ami-owner                     = "099720109477" // Amazon is the owner
        instance-type                 = "t3a.large"
        root-volume-size              = 10
        vpc-id                        = data.terraform_remote_state.network.outputs.dev-toanleh-devops-vpc.id
        security-group-ids            = data.terraform_remote_state.network.outputs.security-groups.sd2079-host
        ebs-volume-count              = 0 // increase this value if you want to add more disk
        ebs-volume-size               = 20
        create-default-security-group = true
        generate-ssh-key-pair         = true
        ssh-key-pair-path             = "./"
        associate_public_ip_address   = true
        subnet_id                     = data.terraform_remote_state.network.outputs.dev-public-subnet-0.id
        availability-zone             = data.terraform_remote_state.network.outputs.dev-public-subnet-0.availability_zone
        instance-count                = 1
        iam-role-default-name         = data.terraform_remote_state.bootstrap.outputs.sd2079_role_name
        iam-instance-profile-name     = "sd2079-host-1-profile"
        ebs-volume-name               = "volume of the sd2079 host"
    }
  }
}   