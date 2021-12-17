# if this doesn't make sense its "default"
profile = "aws_cli_profile_to_use"

# gpg -k
# gpg --export id_of_the_public_key_to_use | base64
pgp_key = <<EOF
paste results of `gpg --export id_of_the_public_key_to_use | base64`
EOF
