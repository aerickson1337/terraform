#!/bin/bash
terraform get -update
terraform init -backend=false
terraform plan -out=backend.plan -target=module.backend
terraform apply backend.plan
cat terraformconf.txt > terraformconf.tf
sleep 5
terraform init -reconfigure \
    -backend-config="bucket=tfstate-$1" \
    -backend-config="key=states/terraform.tfstate" \
    -backend-config="encrypt=1"
