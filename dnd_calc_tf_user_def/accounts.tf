variable "pgp_key" {
  type = string
}

module "admin" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 4.3"

  name                          = "admin"
  create_iam_user_login_profile = false
  create_iam_access_key         = true
  pgp_key                       = var.pgp_key
}

output "admin_id" {
  value = module.admin.iam_access_key_id
}

output "admin_encrypted_key" {
  value = module.admin.iam_access_key_encrypted_secret
}

module "iam_group_superadmins" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "~> 4.3"

  name = "admins"

  group_users = [
    module.admin.iam_user_name,
  ]

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
  ]
}