terraform init

terraform plan -var 'admin_password=<your-admin-password>' -var 'allowed_ssh_ip=<your-ip-address>'

terraform apply -var 'admin_password=<your-admin-password>' -var 'allowed_ssh_ip=<your-ip-address>'
