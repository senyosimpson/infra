# just --list
@default:
  just --list

# terraform plan
plan:
  terraform -chdir={{justfile_directory()}}/digitalocean plan --var do_token=${DIGITAL_OCEAN_TOKEN} --var name=fly

# terraform apply
apply:
  terraform -chdir={{justfile_directory()}}/digitalocean apply --var do_token=${DIGITAL_OCEAN_TOKEN} --var name=fly